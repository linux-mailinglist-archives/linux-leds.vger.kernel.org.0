Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D525100B31
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 19:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKRSNi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 13:13:38 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41858 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfKRSNh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 13:13:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id e9so16195950oif.8;
        Mon, 18 Nov 2019 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0YBDLZW4+twIVpnN2ILKo8XvC4FRlRRziWkB81q9XmU=;
        b=QxH78jpQRyFraTkoqNxRuwt+OjFvvawMmMlXqi6/8+nTPASMdsqzXwFN9M9ApMLfT2
         NU1i2Dgl3LFFTgd+3OvSZK23QaVp9V2jxSqSctlZEXJgI0Tqz9LSOLUu0hr0y8mOtzQ+
         dIQRJbDmWsR5GzvmYfcnDeiJIHFqiAAzRbpFvd/5DIsoCZR++xULR26LHdEbA9envywT
         RZHTOTh+UzQaevhNvt6LbRpRp9cEK/cfytkjAuBXAYX/00SlODZHrtJLVGx7Gorqjf0P
         vhibzctT1DIungPUP9kP69iXdKAhVCnXlAVkqP7jVN+mWfy8x5b4+9a7KqOZyZckDxJ0
         TmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0YBDLZW4+twIVpnN2ILKo8XvC4FRlRRziWkB81q9XmU=;
        b=nMegt8S2R4SNM8rzwcybhC3b/lwmfCTru/hHVs9dBtcWBHzL9ISRwlbV2uibfsRU5s
         uJRB+JwWBEgG66dPd85xPJv1t7W5JuEqSufSzsmtLkcA1vY6Sx+UM4Fz3ZqTQzlzBuwm
         WSkQ2LawevGQMdZ72v17MqZ4JfI/78Em+z8ifZDE/b6SLYbe5yBJUEWK3RIWIGYsGHHv
         Mme36IKD1mennF3qBqqhu7W6r+d7Miigln0kRltXMohqXaVzBjLMoeQ4zxcwzXLdI17g
         W0G4U/+JcCsXT72ExJiyI8puFCkCIAL2kkBStQPXK2bEjx4TpcrHTfudV4OA0XPclocZ
         4NsQ==
X-Gm-Message-State: APjAAAVZAY/2Xpr7ZF2e8OQ2eygpiKEVnGOzToff8wjKbKHgM4dSYRlT
        KJ6JTNoAiR4d0rTxGaM4hTh0l/ipOO0OeG+FEpo=
X-Google-Smtp-Source: APXvYqzRDD6gOeJMTxC//zqOu6MSEGAJ3T+n2+CFC9jbLLdZikPuevrJGGkDWGcf+2jJ6k3aREBuThxVwSRB5WYMwQs=
X-Received: by 2002:a05:6808:3a1:: with SMTP id n1mr232755oie.86.1574100815707;
 Mon, 18 Nov 2019 10:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20191118165400.21985-1-TheSven73@gmail.com> <20191118165400.21985-2-TheSven73@gmail.com>
 <20191118170111.GL9761@sirena.org.uk> <CAGngYiW+8m4fBAY5Ya_4YmEmCTQeiiNP6=aH2mUX6d2wY1442w@mail.gmail.com>
 <20191118174550.GA43585@sirena.org.uk>
In-Reply-To: <20191118174550.GA43585@sirena.org.uk>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 18 Nov 2019 13:13:24 -0500
Message-ID: <CAGngYiXLx8rkkKPyALYyCHFyst2Ft8bCkP4uqmzXAHHqXhUvkQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] tps6105x: add optional devicetree support
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Nov 18, 2019 at 12:45 PM Mark Brown <broonie@kernel.org> wrote:
>
> So this is one device that has two separate modes?  This sounds like you
> need a property specifying how the device is wired up, or possibly just
> different compatibles at the root of the device though that's not quite
> idiomatic.  Splitting this up with different devices is a bit of a Linux
> specific implementation detail.

Yes, that does make sense and sounds elegant. However, bear with me:

This mfd chip can be wired up as one of the following:
- gpio only
- gpio + regulator
- gpio + led
- gpio + flash

So I need a way to indicate this in the dt.

Imagine I do this with a text/value property, like this:

i2c0 {
        tps61052@33 {
                compatible = "ti,tps61050";
                reg = <0x33>;
                mode = "regulator"; // or
                mode = <TPS6105X_REGULATOR_MODE>;
        };
};

in this case, there is no elegant way to specify the regulator properties in
the devicetree. Except by grabbing a reference to a subnode perhaps. And then
I'd have to somehow make sure that the sub driver's device->of_node points
at this subnode, which the mfd core doesn't do automatically.

Now imagine I use a reference property:

i2c0 {
        tps61052@33 {
                compatible = "ti,tps61050";
                reg = <0x33>;
                mode = <&tps_reg>;

                tps_reg: regulator {
                        regulator-min-microvolt = <5000000>;
                        regulator-max-microvolt = <5000000>;
                        regulator-always-on;
                };
        };
};

However for this to work, I need to make sure the regulator subdriver gets a
valid dev->of_node, which the mfd core doesn't do automatically. So I'd have
to follow the 'mode' node, check that its compatible is correct, and then
manually assign the of_node to the mfd child driver (not sure how to even
do that).

So I arrived at the following:

i2c0 {
        tps61052@33 {
                compatible = "ti,tps61050";
                reg = <0x33>;

                regulator {
                        compatible = "ti,tps6105x-regulator";
                        regulator-min-microvolt = <5000000>;
                        regulator-max-microvolt = <5000000>;
                        regulator-always-on;
                };
        };
};

In this case, I only need to verify that there is at most one single subnode.
And when I specify of_compatible = "ti,tps6105x-regulator" in the mfd cell,
the mfd core will automatically assign the child driver's of_node. Nice 'n
elegant?

Would you be able to suggest a way forward?
