Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51AF5999AB
	for <lists+linux-leds@lfdr.de>; Fri, 19 Aug 2022 12:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348058AbiHSKUg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Aug 2022 06:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348305AbiHSKUP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Aug 2022 06:20:15 -0400
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84273EF9E6
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 03:20:12 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by srv6.fidu.org (Postfix) with ESMTP id 8D22FC80095
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 12:20:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
        by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id hHEjI60nUY4A for <linux-leds@vger.kernel.org>;
        Fri, 19 Aug 2022 12:20:09 +0200 (CEST)
Received: from [IPV6:2003:e3:7f25:9300:24a1:e7ce:d3e2:76ba] (p200300E37f25930024A1e7ced3E276ba.dip0.t-ipconnect.de [IPv6:2003:e3:7f25:9300:24a1:e7ce:d3e2:76ba])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: wse@tuxedocomputers.com)
        by srv6.fidu.org (Postfix) with ESMTPSA id 4A3E4C80094
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 12:20:09 +0200 (CEST)
Message-ID: <5f2d6c30-9767-a8f7-0fcb-3c89d4fd6565@tuxedocomputers.com>
Date:   Fri, 19 Aug 2022 12:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Clarification questions regarding multicolor leds
Content-Language: en-US
From:   Werner Sembach <wse@tuxedocomputers.com>
To:     linux-leds@vger.kernel.org
References: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
In-Reply-To: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am 19.08.22 um 09:45 schrieb Werner Sembach:
> Hi,
>
> I'm currently implementing the multicolors sysfs leds interface for 
> several Clevo and Tongfang barebones, but I'm unsure how to actually 
> map the leds to the multicolor interface:
>
> The keyboards come in 5 variants:
>
> Single zone RGB + Brightness
>
> Single Zone RGB
>
> 3 Zone RGB + Shared Brightness
>
> Per Key RGB
>
> Per Key RGB + Shared Brightness
>
> First question: How do I map multiple zones or per-key leds?
>
> Should I register a seperate ::kbd_backlight for zone/key? resulting 
> in ::kbd_backlight, ::kbd_backlight_1, ::kbd_backlight_2, 
> ::kbd_backlight_3, etc?
>
> Should I give them more desciptive names like ::kbd_backlight_left, 
> ::kbd_backlight_center, ::kbd_backlight_right, ::kbd_backlight_a, 
> ::kbd_backlight_b, ::kbd_backlight_enter?
>
> Or Should I only create a single ::kbd_backlight instance and map the 
> different zones to subleds? So there are number of zones * 3 subleds, 
> with each tripplet controlling the rgb values of one zone/key? This 
> would help performance, as for the per-key backlight, the firmware in 
> the backend wants an array for all keys at once. So setting each key 
> seperatly would mean sending the whole array for each key 
> individually. And I think what most people want to do is to set the 
> whole keyboard at once anyway and nit key by key.
>
> Second question: For the keyboards with shared brightness, is it ok to 
> have the brightness values of ::kbd_backlight, ::kbd_backlight_1 etc. 
> just in sync? I did not see a way to have a ::kbd_backlight without 
> the brightness sysfs entry (then I would have just given the 
> brightness switch to ::kbd_backlight and not to ::kbd_backlight_1 and 
> ::kbd_backlight_2)
>
> Third question: The 3 zone RGB and the per-key keyboards have firmware 
> accelerated modes, like breathing and rainbow. How do I make them 
> accessible via the multicolor leds interface? the blinking pattern 
> interface does not really match the usecase as these modes are a 
> simple single value toggle (0=static color, 1=breathing, 2=ignore 
> color settings and play predefined moving rainbow pattern, etc).
>
> Forth question: What is actual the purpose of mc_subled.brightness and 
> mc_subled.channel?
>
> Kind regards,
>
> Werner
>
Another Question: Is max brightness == max color intensity?
