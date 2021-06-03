Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C043139AC4F
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jun 2021 23:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhFCVLh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Jun 2021 17:11:37 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51825 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhFCVLh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jun 2021 17:11:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0B18F5C0217;
        Thu,  3 Jun 2021 17:09:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 03 Jun 2021 17:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=awxrd.com; h=
        date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        GD6Sao3ch6RuLBjaYY+pAj0vpFphuyS8dclr0V44xwQ=; b=R18uZHerqSHeIJDt
        ydKKtWoHg5vHNivu7/2eueymPbx6KaLrLxqL7IYTb4VpZ23cqOM/9+DlhjibxvAZ
        VTX2BTuMAfGvIveGHL2+aI5RoBUd8HBUWYxa0xYh2gQPk+WrEN6a3IX6iFj1uP6Z
        wbHn+jM9/3ySTajODpdz73Z26valtkdIQ3ZHyTDg0JUzkc6v/UDX2K5Yzj336TPw
        mbrhVk6o3dYEj28QERcAg1Ea0p9TjdNSbeQ98Friz78VU9m1jQYf4cJ7ttJyVaoK
        tX32JMWYuwdHZnjM9dCP2y5Gr4ZA+6BPdVlmrgs4AG8FytiDEvdnmAmqgnvBD79C
        zZhyow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=GD6Sao3ch6RuLBjaYY+pAj0vpFphuyS8dclr0V44x
        wQ=; b=dGM4Rp1NVq4o4z3V//KR6T+BuPygBN8ZUtLozgU9Iup4RnvRYdgFwxMCp
        YQyIWIdGu+DY+ujwtju9BysI0tfWn6eWXESGfJ+sjC2kK8uWYovDZGqE5iit5xlO
        WZA7/vf3UWmyyQ9p+mnrA2TFtctq403PCqjM/1wUK77lYQ95FAO6J6T+JJ406fRC
        5OatZXRWijtyWILBXmEfbXiLmTCY4LivJz28E8D3cjuLluwHrJ62FLAEb1H8r6Zs
        PL68NHPR4AOKYA115quQgGshBTDNE4LNn9ZCfjPoj9bK6vjNOPkixSb7hQ1XNK3q
        1+YLWPZ8iVe8uE2dabIOuR4+YHiIQ==
X-ME-Sender: <xms:H0W5YKPF-dQfaRtpFDUTyaY6de7LvIFs1tGLHs2Y7_jcuO3qojYo2A>
    <xme:H0W5YI-0I-pqqey2VAHfP2jwu3o0f9MHlotfHH0orrhq1jVu0WBH-ADrbMVNoFZvw
    T8t2D9UBDaRwFfXPw>
X-ME-Received: <xmr:H0W5YBSzoDKuu-z6au9gIMkNcwgkU0c66fuHmUIUxPh2lJVoSU3rb5AP-jpKqgsIYpx5K0NLjnxj0_b-fpsCoDvNLKkkbpTlpJFh3h5ddw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepffgr
    vhhiugcutfhivhhshhhinhcuoegurhhivhhshhhinhesrgifgihrugdrtghomheqnecugg
    ftrfgrthhtvghrnhepgeevueeugefgfefhveefffelgeffleduheejvefhjeelfefffefh
    hefgveejgedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepughrihhvshhhihhnsegrfiigrhgurdgtohhm
X-ME-Proxy: <xmx:H0W5YKujo6Jj265uItUXVVmYq_KqrIhJ84rjYp9btyixm9updxcKTw>
    <xmx:H0W5YCcWoKzxBrbQU_luZpgUIDff1nKUCC6szkw8YmVtELw3tKnyqA>
    <xmx:H0W5YO0U6xIkp03Ox8cG71N0s5p1Loy74WmDO5ZAsXvKqjWiPEWgBg>
    <xmx:IEW5YC5LNpGJR6DFqLvSBCvR8YAa2G5olREkaJ3sW-z5yAWeXnPQ4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 17:09:50 -0400 (EDT)
Date:   Thu, 3 Jun 2021 17:10:10 -0400
From:   David Rivshin <drivshin@awxrd.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: is31fl32xx: Fix missing error code in
 is31fl32xx_parse_dt()
Message-ID: <20210603171010.37fbf545.drivshin@awxrd.com>
In-Reply-To: <1622545743-21240-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1622545743-21240-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Organization: Allworx
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue,  1 Jun 2021 19:09:03 +0800
Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:

> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'ret'.
> 
> Eliminate the follow smatch warning:
> 
> drivers/leds/leds-is31fl32xx.c:388 is31fl32xx_parse_dt() warn: missing
> error code 'ret'.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Good catch!

Acked-by: David Rivshin <drivshin@allworx.com>

You might also want to add a:

Fixes: 9d7cffaf99f5 ("leds: Add driver for the ISSI IS31FL32xx family of LED controllers")


> ---
>  drivers/leds/leds-is31fl32xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 2180255..899ed94 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -385,6 +385,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  			dev_err(dev,
>  				"Node %pOF 'reg' conflicts with another LED\n",
>  				child);
> +			ret = -EINVAL;
>  			goto err;
>  		}
>  
