Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E9439E639
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jun 2021 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFGSK1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Jun 2021 14:10:27 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36541 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230479AbhFGSK0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Jun 2021 14:10:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id E0C625C02C3;
        Mon,  7 Jun 2021 14:08:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 07 Jun 2021 14:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awxrd.com; h=
        date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        lIBC8OXBc0UOBvvpVKG1lSuscKtvmgtSWseimQKjCfo=; b=h891jaTRSurzEDAW
        LHcIOjMoEvng3nQ1ZdfO5sIzPV3sHexSyFPCH7+q66yAT4PWEQKkDSy9/S41SgN2
        2AHD8koQ59p3xdVtVF3EuxG105Y+6fHmyZ9b2AvUumYIAxz0NbfmW7un62+EFa2j
        9TEj3Wn4jR/n3a5pid/3GZTRSLWb+GHiUFko2VSuXKfI3C2Su39asyQHhKR6OkkE
        VbPi7sVFjtrx2O84e0nBlgCKllDzdvhloZIwOoekJhuMVtWTyoFnWRfOIJ58+dIn
        PrD/dAmeOhbn1/2DlpIDMOeydgsCDb9nFsAdOy6QtPRscVLyKKpQBPC7SpGJcszj
        IG+Z3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=lIBC8OXBc0UOBvvpVKG1lSuscKtvmgtSWseimQKjC
        fo=; b=D1AVFrpMUXHbbF6kA++4FtJ9/0KRhh57WcFlLBF/+AdwwvRkzCGmkdhpM
        OXG8r08CVbFfbMeOZ43AbGsddEhNfane+X/3cQT1NBD50fvhr1tzEnbeBokPkMpV
        G7saBP4zppoSajT1JyQzDTWk9I/t0m4+0U3pJaJyjfYVU0dNL2Gpy3b82XlDMGWR
        5+yKkh3bMmRnr2vgbeoomgnygVEOzuzhyuMQ5iNuWzQZQwLtbdVJultZfTPOYsxP
        NNIY5B4kwtGQnoFKRKszl8VgYMDQdDsP0NQLAX9bq6xHPaAUtu7BmEHHqnGetET5
        he80GW3lzkTAINW6yV7XMQALv7VfA==
X-ME-Sender: <xms:omC-YPPntauLKj_uH53AYmprv16w7xM7k7NiwOfGM6YfNcqPslSZAQ>
    <xme:omC-YJ8w0mBz4pPCK7Wsoo_GDh1mydv7QcbS_kvDAQJgV8fwe5q8OAsn86Shu811t
    J0oldQJAsMccQF80w>
X-ME-Received: <xmr:omC-YOTlIb0MeYsh-fHfAJQ3utNBAiIRQwO7CVVwK9W70-clX5D6oJjRbARms3779xlWrczgh7n3DeLIwwIyn3NiiQKPcw5T6pc-uqG6fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepffgr
    vhhiugcutfhivhhshhhinhcuoegurhhivhhshhhinhesrgifgihrugdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevgeelkeffueevtddtffdthfelveffkeeuteevveeuudeltefh
    feeiieetveehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurhhivhhshhhinhesrgifgihr
    ugdrtghomh
X-ME-Proxy: <xmx:omC-YDsmDefW7sGK07OK1sLag_1Rn_ayfqsm5-SciHsQl4jT2WFiGg>
    <xmx:omC-YHcNmtWoRB3ZtisQOGTS_4t065ThoEKkt7UTMhuZ0dAB9Ns_ow>
    <xmx:omC-YP1BS3fV-I-gLjHY0qHSHW41Iyx0ILiJr8wm-_rejiNfb2N6sw>
    <xmx:omC-YO6vKMApay17R_L3NoMyNtVOUs3lnKXPeMeIEtgU5CtI1AJSgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 14:08:33 -0400 (EDT)
Date:   Mon, 7 Jun 2021 14:08:55 -0400
From:   David Rivshin <drivshin@awxrd.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pavel Machek <pavel@ucw.cz>, David Rivshin <drivshin@allworx.com>,
        Jacek Anaszewski <j.anaszewski@samsung.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: leds-is31fl32xx: fix an error in
 is31fl32xx_parse_dt()
Message-ID: <20210607140855.0f6e82c9.drivshin@awxrd.com>
In-Reply-To: <YLtyxq0Ty/7Uo4NS@mwanda>
References: <YLtyxq0Ty/7Uo4NS@mwanda>
Organization: Allworx
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 5 Jun 2021 15:49:10 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Return -EBUSY if the data is already in use (instead of returning
> success).
> 
> Fixes: 9d7cffaf99f5 ("leds: Add driver for the ISSI IS31FL32xx family of LED controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.  It prints an error so the intention seems clear, but
> sometimes making stuff a failure instead of a success can lead to
> unexpected problems in production.  On the other hand, if this is not
> an error then shouldn't we do a continue instead of a goto err?

I originally had it continue (and ignore that LED), but during review 
Jacek commented [1] that he preferred it to be an error condition 
instead. It should be noted that this condition involves an invalid 
devicetree: two (or more) LED sub-nodes on the same controller that 
specify the same controller channel number. FYI, the error message 
originally had a bit more detail which might make that more obvious, 
but it was simplified as part of another cleanup [2]. 

In any event, the end result is that the whole controller will fail to 
probe, and none of it's LEDs will be available. Because it's not a 
temporary condition, I don't think -EBUSY is the appropriate return 
value. 
There happened to be another patch recently that used -EINVAL [3],
which I think is more appropriate.

[1] https://lore.kernel.org/linux-leds/56CDD4AA.5030801@samsung.com/
[2] https://lore.kernel.org/linux-leds/20200917223338.14164-25-marek.behun@nic.cz/
[2] https://lore.kernel.org/linux-leds/1622545743-21240-1-git-send-email-jiapeng.chong@linux.alibaba.com/

> 
>  drivers/leds/leds-is31fl32xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 3b55af9a8c58..e6f34464914f 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -386,6 +386,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  			dev_err(dev,
>  				"Node %pOF 'reg' conflicts with another LED\n",
>  				child);
> +			ret = -EBUSY;
>  			goto err;
>  		}
>  


