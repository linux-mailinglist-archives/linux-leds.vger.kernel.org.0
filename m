Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CED6ADD26
	for <lists+linux-leds@lfdr.de>; Tue,  7 Mar 2023 12:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCGLVY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Mar 2023 06:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCGLVV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Mar 2023 06:21:21 -0500
X-Greylist: delayed 5368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Mar 2023 03:21:12 PST
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net [87.98.178.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C5523331
        for <linux-leds@vger.kernel.org>; Tue,  7 Mar 2023 03:21:11 -0800 (PST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.143.146])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 96D331FE8D
        for <linux-leds@vger.kernel.org>; Tue,  7 Mar 2023 09:41:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jr9mk (unknown [10.110.208.235])
        by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 011EC1FDEE;
        Tue,  7 Mar 2023 09:41:15 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
        by ghost-submission-6684bf9d7b-jr9mk with ESMTPSA
        id UzyDO7sGB2STSQEALa529g
        (envelope-from <rafal@milecki.pl>); Tue, 07 Mar 2023 09:41:15 +0000
MIME-Version: 1.0
Date:   Tue, 07 Mar 2023 10:41:15 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org,
        William Zhang <william.zhang@broadcom.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: bcm63138: refer to ARCH_BCMBCA instead of
 ARCH_BCM4908
In-Reply-To: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
References: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9e448d3d42b4b3029e4b8993f2272e4c@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 485262861866281947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeetheelfefgjedutdeivdduvdethffhhedulefggeeitdejudfhkeetjeekieejgfenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefpdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2023-03-07 09:29, Lukas Bulwahn wrote:
> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
> index 945c84286a4e..bdcb7377cd4e 100644
> --- a/drivers/leds/blink/Kconfig
> +++ b/drivers/leds/blink/Kconfig
> @@ -1,10 +1,10 @@
>  config LEDS_BCM63138
>  	tristate "LED Support for Broadcom BCM63138 SoC"
>  	depends on LEDS_CLASS
> -	depends on ARCH_BCM4908 || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
> +	depends on ARCH_BCMBCA || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	depends on OF
> -	default ARCH_BCM4908
> +	default ARCH_BCMBCA
>  	help
>  	  This option enables support for LED controller that is part of
>  	  BCM63138 SoC. The same hardware block is known to be also used

William: do we want LEDS_BCM63138 default on all BCMBCA devices?
