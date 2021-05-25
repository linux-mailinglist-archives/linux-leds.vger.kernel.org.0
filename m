Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A8A3906CE
	for <lists+linux-leds@lfdr.de>; Tue, 25 May 2021 18:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbhEYQnq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 May 2021 12:43:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:43629 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhEYQnp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 25 May 2021 12:43:45 -0400
IronPort-SDR: GNZJPi+bpFzkbt+pJ7C3YZFqXDXmgdpzaDgHCuanJCQjngMyX+8GTLqZc1fnk0WsxCZmy/ZLQT
 fOIlj6zlQg7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189361050"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="189361050"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:42:15 -0700
IronPort-SDR: l4DN666H4yXNIo0naONZS3J7NUAYNDO2AKQkWzbg4dPz0ott1wpg5Yu6lQqmnGHBYXWNtBMa3m
 poJorSxW55Rg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="476498056"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:42:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 94C5E20337;
        Tue, 25 May 2021 19:42:10 +0300 (EEST)
Date:   Tue, 25 May 2021 19:42:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 1/1] leds: as3645a: Fix error return code in
 as3645a_parse_node()
Message-ID: <20210525164210.GK3@paasikivi.fi.intel.com>
References: <20210515030646.6877-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515030646.6877-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 15, 2021 at 11:06:46AM +0800, Zhen Lei wrote:
> Return error code -ENODEV rather than '0' when the indicator node can not
> be found.
> 
> Fixes: a56ba8fbcb55 ("media: leds: as3645a: Add LED flash class driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
