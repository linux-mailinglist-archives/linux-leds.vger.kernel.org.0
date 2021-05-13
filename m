Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9662337F26D
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 06:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEMExG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 May 2021 00:53:06 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56011 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230112AbhEMExF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 13 May 2021 00:53:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id AE372281C;
        Thu, 13 May 2021 00:51:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 13 May 2021 00:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=52aNsqNNX8zD1+Cg/6i/CZRsF/Iq63e
        zVWrIeuWzduU=; b=If+LRK8+pAH+wPMgRDC+I0+D5VCFj1CJNPco4FjHlEiLYur
        i2HrblvIrN4aMqNGQWOFpmoN22n/jmuiIH0EdNErcY5jrg7rJjcs/IxPcTtcGQGO
        DCpx5iM+G3C98w3OuNE2TDFT+EqGCUJNK/iE/fdVLyXU70PPhwD+VGfemaHZcqvN
        +yH1dtbdLUlZ+5+f56CudOdf0ZxpVG97kmiUcitMQMsoLCzCwPh6eEMAi3270c4/
        xsO85bFXbWg510RXNfe8dAn3uk2CZRCdiWkdvi7eRngymy/t/zteHEDiMD1ysEyv
        ZTY5yT5iA+mdKHe/mkPZ/Ii/dR/Pmn2hVr3nuTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=52aNsq
        NNX8zD1+Cg/6i/CZRsF/Iq63ezVWrIeuWzduU=; b=CU2iKN6GiGXOyMrXIh16m/
        kKrkhFer8JMtEy32y84ZkVzT/Gs3RkoyCJet6yKZyua7J5SPxENxq+L9oD352jPr
        ybKg12Cx/ViEd3HwKu/Ad9yO/Q/+jWacONYuUmbYrpvLvZzy1mmcnegiFjb9Jxs4
        9EWP6/Zaf5rRz5yO7dwVX3Z38rwZbPFfYbAp/GbGt/9w+JYkUp8DamN5823ktNpb
        6P9/C3F8tS/kJKK6NowHPU3/Ca2Iz+d+hnK0hq/iWwdCC/Z+1t4UTWrKhbTDPUD4
        bjXGsBAwpQfcHC0MMnuUhdf9E/xTbKBB3qtodUjp3hpHV7MCzGx6VkbxFCAK5fTg
        ==
X-ME-Sender: <xms:aLCcYFCu-eoI_2NuTVDsxQJHfhpCGZCJAQmU85uU6PkdRo9z0erBLg>
    <xme:aLCcYDg0obh7khA79gAugK_WaZqFCmxeAFHsnhwjBiorU0opM6aN7Dd-s-xBi4hXB
    7kE6ZOzrfJORzxbSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:aLCcYAnkjRydyGI0qeTeTALJSIOmrjk0NmqCZleB8hJcgLDdcZwncg>
    <xmx:aLCcYPyZee71nHes7DWOx7vzE8XPktFQyH52nT62ljMVLEa4sgwDDw>
    <xmx:aLCcYKS8soIm5lDyB_iuyEE_C0VrCc7KQgqxmULFkRO2gJH_XNM04w>
    <xmx:abCcYHKqGjtmiY1g9WbXAbd7FmsGvx99n5xsoGxaMKEo6LMG32EhZg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 75B24A00079; Thu, 13 May 2021 00:51:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <1ffffb47-4846-4769-910f-6606a1364a74@www.fastmail.com>
In-Reply-To: <20210429205002.70245-3-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
 <20210429205002.70245-3-eajames@linux.ibm.com>
Date:   Thu, 13 May 2021 14:21:32 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Eddie James" <eajames@linux.ibm.com>, linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, "Pavel Machek" <pavel@ucw.cz>,
        "Jacek Anaszewski" <jacek.anaszewski@gmail.com>, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com
Subject: =?UTF-8?Q?Re:_[PATCH_2/5]_leds:_leds-core:_Implement_the_retain-state-sh?=
 =?UTF-8?Q?utdown_property?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On Fri, 30 Apr 2021, at 06:19, Eddie James wrote:
> Read the retain-state-shutdown device tree property to set the
> existing LED_RETAIN_AT_SHUTDOWN flag. Then check the flag when
> unregistering, and if set, don't set the brightness to OFF. This
> is useful for systems that want to keep the HW state of the LED
> across reboots.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/leds/led-class.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2e495ff67856..f2f29318d312 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -354,10 +354,15 @@ int led_classdev_register_ext(struct device *parent,
>  		if (ret < 0)
>  			return ret;
>  
> -		if (init_data->fwnode)
> +		if (init_data->fwnode) {
>  			fwnode_property_read_string(init_data->fwnode,
>  				"linux,default-trigger",
>  				&led_cdev->default_trigger);
> +
> +			if (fwnode_property_present(init_data->fwnode,
> +						    "retain-state-shutdown"))
> +				led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;

This is what we need, but I notice the pca955x driver is calling 
through devm_led_classdev_register() which passes NULL through 
init_data. So we won't get the result we want from this series as I 
understand it.

Andrew
