Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014CA3386B9
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 08:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCLHov convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 12 Mar 2021 02:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhCLHoT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 02:44:19 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1FAC061574
        for <linux-leds@vger.kernel.org>; Thu, 11 Mar 2021 23:44:18 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 746F8140AB2;
        Fri, 12 Mar 2021 08:44:14 +0100 (CET)
Date:   Fri, 12 Mar 2021 08:44:14 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
Message-ID: <20210312084414.7e4822bb@nic.cz>
In-Reply-To: <20210310070025.9150-1-zajec5@gmail.com>
References: <20210310070025.9150-1-zajec5@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 10 Mar 2021 08:00:25 +0100
Rafał Miłecki <zajec5@gmail.com> wrote:

> From: Rafał Miłecki <rafal@milecki.pl>
> 
> The old regex allowed only 1 character to follow the "led-" prefix which
> was most likely just an overlook. Fix it and while at it allow dashes in
> node names. It allows more meaningful names and it helpful e.g. when
> having the same function name with 2 different colors. For example:
> 1. led-power-white
> 2. led-power-blue
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> index 7ad2baeda0b0..ae46a43e480f 100644
> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> @@ -21,7 +21,7 @@ properties:
>  patternProperties:
>    # The first form is preferred, but fall back to just 'led' anywhere in the
>    # node name to at least catch some child nodes.
> -  "(^led-[0-9a-f]$|led)":
> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":

Why not use +, like everywhere else?
  "(^led-[0-9a-f]+$|led)"
