Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B47030F8
	for <lists+linux-leds@lfdr.de>; Mon, 15 May 2023 17:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbjEOPG6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 May 2023 11:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242005AbjEOPG6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 11:06:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DF4E76
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 08:06:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A3B961E74
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 15:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4953C433D2;
        Mon, 15 May 2023 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684163205;
        bh=Gp2NcuYGHLqe7ZefP3ekDxLshzHl1vHuekSExmNiyOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gpu6tTGhpa7uYL9aggeAvhZqyHjGuty5vKvkpZ2HoBePEquMs1h6aJL+9JUVDuWqu
         YQ8aBW+iydHG8ln4rprN7thjNw8BfEIwUMY0Y0w/zLpm+TZ81g/ke7x/nv6/XDc0Yr
         vI8VuzK1JTuHgfJHlcon80LuVTRdh2uW/0ulLGiIWEeusiYx5Xxo4SXAccki3zwpv7
         HZ7TB4qh2U1DEU+vg/2RJSCjChEGDhzoYRZO/VAm+X8rrmaAPso1TkMv0lLL69+Sy9
         xXHPJQqdD0XeBRQIzNycz3EoaVqsfnTLZGEiQJLeThllApBqF5iSo+QySc/MUZMlXF
         7ShzL6td9Y0sw==
Date:   Mon, 15 May 2023 16:06:40 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/5] leds: cht-wcove: Add suspend/resume handling
Message-ID: <20230515150640.GI10825@google.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <20230430195952.862527-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430195952.862527-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 30 Apr 2023, Hans de Goede wrote:

> When LED1 is showing the tablet is charging and then the device gets
> suspended followed by unplugging the charger, then it will incorrectly
> still show it is charging.
> 
> To avoid this turn both LEDs off on suspend, just like the PMIC always
> turns them off when the tablet is powered off (even if the tablet is
> charging). If hw-control is supported for LED1, then restore the
> initial hw-control settings to let the hw control LED1 while suspended.
> 
> To restore the state the LEDs had before suspending, save it before
> turning the LEDs off and restore it on resume.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/leds-cht-wcove.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
