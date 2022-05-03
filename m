Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B6D518412
	for <lists+linux-leds@lfdr.de>; Tue,  3 May 2022 14:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiECMUI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 May 2022 08:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbiECMUI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 May 2022 08:20:08 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAE227CE8
        for <linux-leds@vger.kernel.org>; Tue,  3 May 2022 05:16:36 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <4e88850e-9e45-2b47-c857-7070ec87440f@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651580194;
        bh=h0WZQiqVkm+jM9J9mPn/GZSo/9EGqrbo4925YuOyb1k=;
        h=To:Cc:From:Subject;
        b=pHCR0krwIu3aNZ1FtMiq7cDJyxcOeiwQoDAW4LW67+jiFI8Sx3iDXKACw1JrhPSmE
         peg+eY5JV5ssrylXyreSSpztAS2kM3+aSC46T/sRFPeKZfhsMLwZcaFD0Ve4bGOzSI
         0iomtojqTMNXqh50elOeE0ZVOYia3TuDQzlNsQkh6n8ev2IxF2qjUSEU5srefwiOaz
         6qye5WI1e2tedu/shhf0a5f9tesUri0a7BVF4NTP/3NL2pPovGsFpOJSiHGZjlz+cc
         QYk/pbB5YOUzgD/LpZwYkScwqTEAzmzdlYjxYZgDkkN3su5m5cak+LXOb9f1y4DYsy
         NbOLbNoCuk1wQ==
Date:   Tue, 3 May 2022 14:16:33 +0200
Mime-Version: 1.0
Content-Language: en-US
To:     linux-leds@vger.kernel.org
Cc:     pavel@ucw.cz
From:   Sven Schwermer <sven@svenschwermer.de>
Subject: Setting multi-color intensities stops software blink
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

I'm experiencing an issue with multi-color LEDs when setting the 
intensities while software blinking is active (e.g. trigger=timer). This 
manifests itself by delay_on and delay_off being set to 0 when writing 
multi_intensities while the LED is off. If doing this while the LED is 
on, everything works as expected.

I suspect that this happens because multi_intensity_store() calls 
led_set_brightness(led_cdev, led_cdev->brightness) at the end. It seems 
like the software blinking modifies led_cdev->brightness directly, so if 
the LED is in its off-phase, we're effectively switching the LED off 
because we're setting its brightness to 0 which clears delay_on and 
delay_off to 0:

led_set_brightness(brightness=0): sets LED_BLINK_DISABLE
  -> set_brightness_delayed()
   -> led_stop_software_blink(): clears blink delays

How would one fix this properly? Should multi_intensity_store() call 
led_set_brightness() with brightness=led_cdev->blink_brightness if 
blinking is active? That feels like an unclean solution.

I'm hoping for some input. Thanks :)

Best regards,
Sven

