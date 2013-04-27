package ug.nosql.geo

import com.mongodb.util.JSON
import org.springframework.dao.DataIntegrityViolationException

class CommunityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def HelperService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [communityInstanceList: Community.list(params), communityInstanceTotal: Community.count()]
    }

    def create() {
        [communityInstance: new Community(params)]
    }

    def save() {
        def communityInstance = new Community(params)
        if (!communityInstance.save(flush: true)) {
            render(view: "create", model: [communityInstance: communityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'community.label', default: 'Community'), communityInstance.id])
        redirect(action: "show", id: communityInstance.id)
    }

    def show(Long id) {
        def communityInstance = Community.get(id)
        if (!communityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "list")
            return
        }

        [communityInstance: communityInstance]
    }

    def edit(Long id) {
        def communityInstance = Community.get(id)
        if (!communityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "list")
            return
        }

        [communityInstance: communityInstance]
    }

    def update(Long id, Long version) {
        def communityInstance = Community.get(id)
        if (!communityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communityInstance.version > version) {
                communityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'community.label', default: 'Community')] as Object[],
                          "Another user has updated this Community while you were editing")
                render(view: "edit", model: [communityInstance: communityInstance])
                return
            }
        }

        communityInstance.properties = params

        if (!communityInstance.save(flush: true)) {
            render(view: "edit", model: [communityInstance: communityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'community.label', default: 'Community'), communityInstance.id])
        redirect(action: "show", id: communityInstance.id)
    }

    def delete(Long id) {
        def communityInstance = Community.get(id)
        if (!communityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "list")
            return
        }

        try {
            communityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'community.label', default: 'Community'), id])
            redirect(action: "show", id: id)
        }
    }
	
	//////////////
	def get(Long id) {
		def instance = Province.get(id)
		if (!instance) {
			render ([error: "missing object"]) as JSON
		}else{
			render(contentType: "text/json") {
				object(name: instance.name, center: instance.center, border: HelperService.toPairList(instance.border), data: instance.data)
			}
		}
	}
}
