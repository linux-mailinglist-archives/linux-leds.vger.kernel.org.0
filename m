Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF453494FE7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jan 2022 15:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242388AbiATOPO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Jan 2022 09:15:14 -0500
Received: from mail.schwermer.no ([49.12.228.226]:60866 "EHLO
        mail.schwermer.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiATOPO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Jan 2022 09:15:14 -0500
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Jan 2022 09:15:13 EST
Message-ID: <37540afd-f2f1-52dd-f4f1-6e7b436e9595@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1642687647;
        bh=z82mvfS5iFtIXIER5KhqoW640BL8K9RLEcTejsx8pBU=;
        h=To:From:Cc:Subject;
        b=lToAz4aRa7GUOh2Y/cQvrziGshIF1jNKQPQVCvZsNSu58cCQSbvM7ltOcpqnUNNMY
         TANrNI1/yQ79tDbPC0XFvP60tCsYSX54FaKNfcshxZUrl8Zr6SFQdkBxfYYyobmBXB
         mnI+TNwwtEbfSUM14PNtNL+wq1YynSyDMUGfxCIJ2w8hfFoFMD7BJBzmtkM3MWxYNR
         6IIgETjiAh20YwxtHv6k99oAqTEZxVBQxeRkFHvZ302DulTEAywtkjkBQb8Ga8tZQ8
         yIs4i5J9ZjYuYbSTUkcLyHN4SAVel/fPYOoLGI0f1sAYI2spZorN+VNM8+YBgNgnTs
         yTDkFb38tuTLw==
Date:   Thu, 20 Jan 2022 15:07:26 +0100
Mime-Version: 1.0
Content-Language: en-US
To:     linux-leds@vger.kernel.org
From:   Sven Schwermer <sven@svenschwermer.de>
Cc:     pavel@ucw.cz, lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        thierry.reding@gmail.com
Subject: Combining multiple PWM LEDs into RGB LED?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

I'm wondering about the correct device tree syntax for organizing 
multiple PWM LEDs into a multi-color (RGB) LED. This is my device tree:

/ {
   rgb-led {
     pinctrl-names = "default";
     pinctrl-0 = <&pinctrl_leds>;
     compatible = "pwm-leds";
     multi-led@0 {
       color = <LED_COLOR_ID_RGB>;
       led-red {
         pwms = <&pwm1 0 1000000>;
         color = <LED_COLOR_ID_RED>;
         max-brightness = <65535>;
       };
       led-green {
         pwms = <&pwm2 0 1000000>;
         color = <LED_COLOR_ID_GREEN>;
         max-brightness = <65535>;
       };
       led-blue {
         pwms = <&pwm3 0 1000000>;
         color = <LED_COLOR_ID_BLUE>;
         max-brightness = <65535>;
       };
     };
   };
   /* ... */
};

My kernel complains as follows:

of_pwm_get(): can't parse "pwms" property
leds_pwm rgb-led: unable to request PWM for multi-led: -2
leds_pwm: probe of rgb-led failed with error -2

Is my syntax incorrect or is this not a use case that is currently 
supported? I should also note that I back-ported the multi-LED feature 
to 5.4.158 so I may have missed some relevant patches.

Any insight is appreciated.

Best regards,
Sven
