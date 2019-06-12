Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792D142AA9
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 17:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfFLPSu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jun 2019 11:18:50 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:24836 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfFLPSt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 12 Jun 2019 11:18:49 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 3D0D2201F4;
        Wed, 12 Jun 2019 17:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1560352722; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iz3CpY34we/DvAotNLRGWsXayWK0i3l2X+/9ZHiFnyw=;
        b=jjbfNYpPxGZWgMtcEFGgK1M7jzrSmGfdOaQZfXN5TA7uwH5qjLXLYw/9ECOTC2PICKghjD
        V3eKX1dCeTpnmLbZhkjskt+NIEO7og8F432987h0blEpWYrYxDMw03Kjw0aSiPuaU7s22E
        m1x4nHyxmh9t7UIQqwo1HgsMPSkVVcxUAHSXkujKSYZWF8C+oQTGvz1BM35lUFomieE02i
        +OJJit5QLNdPMBYmGWrgBh4pRB45VdylUdL31O2Wj9Tn+oyan/vnIqRfztl4OqS+TZ/7Kx
        VEK4JbTC3m9TOwE0am5yfFhdCtgy0rHOyatoM1/oZAZOaJ2dRbFzaru/rZyIUg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id C86DEBEEBD;
        Wed, 12 Jun 2019 17:18:41 +0200 (CEST)
Message-ID: <5D0117D0.501@bfs.de>
Date:   Wed, 12 Jun 2019 17:18:40 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Colin King <colin.king@canonical.com>
CC:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] leds: lm36274: remove redundant initialization
 of variable ret
References: <20190612145659.26514-1-colin.king@canonical.com>
In-Reply-To: <20190612145659.26514-1-colin.king@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[7];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



Am 12.06.2019 16:56, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read, hence it is redundant and can be removed.  Also move the
> declaration of ret to the for loop scope.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/leds/leds-lm36274.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index ed9dc857ec8f..b55bd238c074 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -74,7 +74,6 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>  	struct device *dev = &lm36274_data->pdev->dev;
>  	const char *name;
>  	int child_cnt;
> -	int ret = -EINVAL;
>  
>  	/* There should only be 1 node */
>  	child_cnt = device_get_child_node_count(dev);
> @@ -82,6 +81,8 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>  		return -EINVAL;
>  
>  	device_for_each_child_node(dev, child) {
> +		int ret;
> +
>  		ret = fwnode_property_read_string(child, "label", &name);
>  		if (ret)
>  			snprintf(label, sizeof(label),

this looks odd,
i would leave ret in place or move char *name also.

just my 2 cents,

re,
 wh
