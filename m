Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F85F257665
	for <lists+linux-leds@lfdr.de>; Mon, 31 Aug 2020 11:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgHaJUT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 05:20:19 -0400
Received: from mail.thorsis.com ([92.198.35.195]:49826 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHaJUS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 31 Aug 2020 05:20:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 7B580324E;
        Mon, 31 Aug 2020 11:20:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V1NgYPgywrN7; Mon, 31 Aug 2020 11:20:16 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 4936B3614; Mon, 31 Aug 2020 11:20:16 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH] leds: pwm: Allow automatic labels for DT based devices
Date:   Mon, 31 Aug 2020 11:20:09 +0200
Message-ID: <1837645.vzTIdMnA0P@ada>
In-Reply-To: <eff509d5-a5f7-0d5d-b39c-aac364e53aca@gmail.com>
References: <20200826093737.29008-1-ada@thorsis.com> <7920560.iacgkFlgr8@ada> <eff509d5-a5f7-0d5d-b39c-aac364e53aca@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek,

Am Freitag, 28. August 2020, 22:43:02 CEST schrieb Jacek Anaszewski:
> On 8/28/20 9:00 AM, Alexander Dahl wrote:
> > Am Donnerstag, 27. August 2020, 23:28:45 CEST schrieb Jacek Anaszewski:
> >> This part looks good, but corresponding update of
> >> Documentation/devicetree/bindings/leds/leds-pwm.txt is needed as well.
> >=20
> > I'm not sure, what needs updating. The properties 'function' and 'color'
> > are already documented in
> > Documentation/devicetree/bindings/leds/common.yaml =E2=80=A6 the only t=
hing I can
> > think of here is updating the examples? That would be nice, as would be
> > updating to yaml, but I don't see the strong relation, yet.
> It is necessary to tell the user that given driver is capable of
> utilizing a property. I thought of something like in commit [0].
>=20
> >> It would be good to switch to yaml by this occassion.
> >=20
> > Is there some guidance on that in general?
>=20
> I am not aware of, but surely sooner or later all bindings will
> need to be unified. Touching the file is always a good opportunity
> to address that. It's up to you, though.

This update from txt to yaml is a manual task and after reading [1] and som=
e=20
other examples, I tried to come up with something.  I pushed the WIP to my=
=20
GitHub tree and will run the checks recommended by [1] later in the evening=
=2E =20
If that goes well, I'll send a v2 series.

> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/Do
> cumentation/devicetree/bindings/leds/leds-lm3692x.txt?id=3D4dcbc8f8c59f4b=
618d6
> 51f5ba884ee5bf562c8de

Well okay, that was for the old format, but I see what you mean.

Greets
Alex

[1] https://www.kernel.org/doc/html/latest/devicetree/writing-schema.html



