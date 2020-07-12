Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F5E21CB9B
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 23:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgGLVki (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 17:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgGLVki (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 17:40:38 -0400
X-Greylist: delayed 2074 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Jul 2020 14:40:38 PDT
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D33EC061794;
        Sun, 12 Jul 2020 14:40:38 -0700 (PDT)
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id BA4F0140594;
        Sun, 12 Jul 2020 23:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594590035; bh=0tmjwOjoPMLu+GZtczo0vI4XCq3UPDxEUek63EMvMNE=;
        h=Date:From:To;
        b=dnx5IRLv1YLoMZDYZ+PFKOqDNFGMuV5VBuaApRSIJaWzDMmzjukfk3Qp4wk7XeCm+
         r16+qNtdj7VPDctBdRp9xX7+AOLsEHnhGsr7fv8Jp8/zbTTyBW1WArPB3ERDh3dpvL
         LdrAzesxOMWS3rFdhh0vDhJCgeeBsK/XlZXSsRPE=
Date:   Sun, 12 Jul 2020 23:40:35 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200712234035.213348aa@nic.cz>
In-Reply-To: <4609c389-4be6-0987-5078-725b43153596@gmail.com>
References: <20200712210601.5239-1-marek.behun@nic.cz>
        <20200712210601.5239-2-marek.behun@nic.cz>
        <4609c389-4be6-0987-5078-725b43153596@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 12 Jul 2020 23:27:07 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> > +            multi-led@0 {
> > +                reg = <0>;
> > +                color = <LED_COLOR_ID_MULTI>;
> > +                function = LED_FUNCTION_POWER;  
> 
> Please provide child nodes for each color LED. Let's stick
> to the bindings closely and not make any deviations from
> the beginning.

Why? It would make sense if there were devices using this controller
having other configuration, but on Omnia, all LEDs are RGB.

Also, if I do this, should I also make the driver check in the probe
function whether the per-channel child nodes are correct? Eg. if they
are always three: one for red, one for green and one for blue? Or
should the driver ignore this and only the device tree binding specify
it?

Because the way the driver is written now, it only registers
multi-color RGB LEDs.

Marek
