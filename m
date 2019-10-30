Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD83EA353
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 19:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfJ3S3T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 14:29:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:54130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbfJ3S3T (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 30 Oct 2019 14:29:19 -0400
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com [209.85.161.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 361572080F;
        Wed, 30 Oct 2019 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572460158;
        bh=8mRUXTJjCOxuDC/f3E4dUcodPz2hwhq9ROb6xWimgUw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fwUUaTjvZFgUJil1IXS9AhVEU264hZRXl50COz5x/XLMLHQQzQiRALUTQ+ZFqpamy
         EpC+HkKQTFm3VhvBG21qnOQFaNNu8/JF98kgY2IBXw1rRQ8XcSpmpXBPDKlKbpoaKO
         /I3qRD/IQ67J10iIrPFh0as4TQTn3WUwRL5dRv9k=
Received: by mail-yw1-f54.google.com with SMTP id r134so1194316ywg.2;
        Wed, 30 Oct 2019 11:29:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUNrv0htz6TpwPevU8aaNvIt7LDhiJzD2lpZY8JENDhjFSi516G
        Hk8NjEwzqJh4txRaNcGi8szN7vA1sHDg73c5Rg==
X-Google-Smtp-Source: APXvYqwPvbH97unUOfenxq59NvH7FZDQPpdp9wB2owQFa72spV1Qvwkwi3QT2jTWlOIv6li8nVbIoxwEwO/fQ1RCJj8=
X-Received: by 2002:a81:2748:: with SMTP id n69mr760082ywn.281.1572460157381;
 Wed, 30 Oct 2019 11:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
 <20191030142417.GA8919@bogus> <CAC5umyhZ+w9b7M=gWGDynoMerZ7FiP3+U_RXyQ2P_p7cuLVRgA@mail.gmail.com>
In-Reply-To: <CAC5umyhZ+w9b7M=gWGDynoMerZ7FiP3+U_RXyQ2P_p7cuLVRgA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 13:29:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKa=936WNhTDQ0S9bW0fYPMHQXSwutjnQs0W9vP8h7sow@mail.gmail.com>
Message-ID: <CAL_JsqKa=936WNhTDQ0S9bW0fYPMHQXSwutjnQs0W9vP8h7sow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 30, 2019 at 10:27 AM Akinobu Mita <akinobu.mita@gmail.com> wrot=
e:
>
> 2019=E5=B9=B410=E6=9C=8830=E6=97=A5(=E6=B0=B4) 23:24 Rob Herring <robh@ke=
rnel.org>:
> >
> > On Sun, Oct 27, 2019 at 11:09:38PM +0900, Akinobu Mita wrote:
> > > Add DT binding for generic LED level meter which consists of multiple=
 LED
> > > devices by different drivers.
> >
> > Do you have some pointers to actual h/w?
>
> This doesn't require a specific hardware.

But I do for my understanding. If I don't understand it, then my
default answer is: no, we don't do "generic" bindings because the h/w
is never generic.

> If there are more than two LEDs that can be described by devicetree,
> it can be an LED level meter by bundling them up with this binding.

Depends on the physical locations too? If you just want to group any
random LEDs, then do that from userspace because it's more flexible.

Rob
