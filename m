Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D91346B9A
	for <lists+linux-leds@lfdr.de>; Tue, 23 Mar 2021 23:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233810AbhCWWDQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 18:03:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233749AbhCWWCm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Mar 2021 18:02:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E663619CB;
        Tue, 23 Mar 2021 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616536962;
        bh=UGaF1BdoQP+8AHGXLr0qK12b3S2ZGiPNLDnL8NiGYq4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ruzin18dnk6MECRkJeR+Z7NodR8z126kHcV0Nk4krnN+t5FTasAoLLeqoKyzQ6i3z
         D2ArSVEBXCzukeU3bdRrD5xhfdbbXlVsvwbqALBs1/h2ZmIz3I78FH1gtTfG80YpeT
         pc4MLVv3gwJhw65/PYz5YV428UB8thnwAGL1y+/PE2+oelmQux3Sw0Tvp8DbR7Zq1N
         +qjhP9l92y/bgELeQjeYpCOb61CBdlgMpvAkDc+dkaodSxfwSPObxTzA8ziw8A5Awc
         t2WcNiKGxPzx5k9qKJNoemwMDCbOnv5p9OxpXDcAQ1kk3MDYANrWPQE0alqkQYFcv4
         /BWb5cIOXrwKw==
Received: by mail-ed1-f50.google.com with SMTP id h10so25245943edt.13;
        Tue, 23 Mar 2021 15:02:42 -0700 (PDT)
X-Gm-Message-State: AOAM533ZSyJ9pUujSdZlDnHaeiF15iU4sfRjDVtAuBLqi7whh6S97Y+4
        uQxFbZe0UXfaE4J3KsUreaMz14T7sKikzwvsbQ==
X-Google-Smtp-Source: ABdhPJy4goe9Vfm85r309ldW3XSg7QI7UVLoW5Yw7vSk+MzNRB/A6GdbQPXsm6bDRdNm65B+dqaUUFgd7KgJmFX3/hQ=
X-Received: by 2002:a05:6402:c88:: with SMTP id cm8mr25627edb.62.1616536960848;
 Tue, 23 Mar 2021 15:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210310070025.9150-1-zajec5@gmail.com> <20210316223122.GA3800914@robh.at.kernel.org>
 <37f56e82-f60a-2375-e809-2b12fde5311b@milecki.pl>
In-Reply-To: <37f56e82-f60a-2375-e809-2b12fde5311b@milecki.pl>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Mar 2021 16:02:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5fPhVCHtUZjoWy6O-y0JWdLTyNDHWv=t64OvUje2Rsg@mail.gmail.com>
Message-ID: <CAL_JsqL5fPhVCHtUZjoWy6O-y0JWdLTyNDHWv=t64OvUje2Rsg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Mar 16, 2021 at 5:25 PM Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> =
wrote:
>
> On 16.03.2021 23:31, Rob Herring wrote:
> > On Wed, Mar 10, 2021 at 08:00:25AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>
> >> The old regex allowed only 1 character to follow the "led-" prefix whi=
ch
> >> was most likely just an overlook.
> >
> > Indeed.
> >
> >> Fix it and while at it allow dashes in
> >> node names. It allows more meaningful names and it helpful e.g. when
> >> having the same function name with 2 different colors. For example:
> >> 1. led-power-white
> >> 2. led-power-blue
> >
> > No, node names are supposed to be generic and reflect the class of
> > device.
>
> There was some extra discussion on this patch that has ended up with a qu=
estion about numbering nodes.
>
> Current binding assumes that nodes should be numbered with independent su=
ffix numbers like:
> led-0 { };
> led-1 { };
> led-2 { };
>
> Do you think this could / should be improved somehow?

No, we have other ways for meaningful names (label, color, function, etc.).

> One option I was thinking about was using:
> led@0 { };
> led@5 { };
> where numbers ("0", "5") should match GPIO numbers.
>
> Is that a valid solution and does it improve things to make it worth it?

What if you have <gpioa 1> and <gpiob 1>?

The cells in a consumer for a provider are opaque to the consumer.

Rob
