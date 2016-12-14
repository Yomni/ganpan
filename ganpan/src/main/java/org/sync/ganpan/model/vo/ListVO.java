package org.sync.ganpan.model.vo;

import java.util.List;

/**
 * 한페이지에서 보여줄 게시물 목록 정보와
 * 페이징 정보를 저장하는 객체
 * @author kosta
 *
 */
public class ListVO<E> {
	private List<E> list;
	private PagingBean pagingBean;

	public ListVO(List<E> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}

}
