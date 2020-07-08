Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A85218A79
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2020 16:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbgGHOzg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jul 2020 10:55:36 -0400
Received: from mail.nic.cz ([217.31.204.67]:54666 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729741AbgGHOzg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 8 Jul 2020 10:55:36 -0400
Received: from dellmb (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 44221140622;
        Wed,  8 Jul 2020 16:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594220134; bh=pcOEVBBXLme8pBsSc+0KgUc76HeovH3+0MKTHCfjTxg=;
        h=Date:From:To;
        b=MPyOasUVkNgrJvHaBkQksWOKKns807KCu+6LPbATJbVVqTMdWhxoqsqVqDyJRWQ1f
         mRBJLHcYgEI1r7W4us+ZX+At9CCpaUA+c12jpJ5jA2CsPN0lpRV0TMxWn2pwPW8Qcg
         Si/F104um95rTFWldWIDb8Sxo66Rg/81552KZ98E=
Date:   Wed, 8 Jul 2020 16:55:33 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     =?UTF-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200708165533.12f1949f@dellmb>
In-Reply-To: <20200703130809.h4mvhwbdiymuo5pn@core.my.home>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
        <20200703130809.h4mvhwbdiymuo5pn@core.my.home>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Ondrej,

I overlooked your reply in my inbox, sorry this took so long.

On Fri, 3 Jul 2020 15:08:09 +0200
Ond=C5=99ej Jirman <megous@megous.com> wrote:

> Do you have such a switch? Also what's your real usecase?

Yes, on Turris MOX three 8-port ethernet switches can be plugged,
resulting in 24 ethernet ports, each having 2 LEDs.
The current driver does not expose these LEDs via sysfs, but I want to
add the support there. Each of these LEDs can be controlled by
software, or can be put into one of these HW controlled modes:
  - Link (with three submodes: 10/100, Gb, 10Gb)
  - Link activity (again with three submodes as above)
  - PTP activity
  - Force blink

> My usecase is a PMIC which has either a user-controllable or
> self-working mode for a single LED it controls. I want to be able to
> switch between those quickly and easily.

I understand your usecase completely. This is the same thing I want. I
just have reservations about how you want to implement this.

Marek

> I want the LED to be mostly controlled by PMIC, because that way PMIC
> can signal events that are not exposed to OS like overvoltage,
> overheating, etc. ... all automagically, but also be able to control
> it sometimes via SW (for non PMIC related notifications, eg.).
>=20
> So in my mindset LED is either controlled by Linux via various SW
> triggers, or it's self-working in some arbitrary device specific
> configuration that doesn't need any passing of the data via CPU for
> the LED to reflect some HW state.
>=20
> So I'd expose a 'hw-trigger' only on the LED device that allows this,
> that you can select among all the other regular triggers as you do
> now, and then configure its precise mode/options in sysfs (on the
> trigger kobj). The driver would come with some sane device specific
> defaults for the self-working mode.
>=20
> User can then select hw-trigger, in the triggers and would get a nice
> PMIC LED behavior controlled by HW, or a common LED behavior of the
> ehternet port, or on the wireless card, or whatever.
>=20
> From the perspective of this use case the interface is nice and
> generic:
>=20
> - you set LED to hw-trigger mode on boot
> - you set trigger to none and poke the LED with a pattern you want
> for the notification and put it back to hw-trigger mode again
> afterwards
>=20
> We can standardize on hw-trigger, or self-controlled, or some other
> name for this kind of private LED trigger, and then the userspace
> would not need to even care about the specific LED device type, when
> sitching between SW controlled and self-working modes.
>=20
> You'd be able to take SW control of the ethernet PHY controlled LEDs
> this way just the same as the PMIC LED with the same interface,
> described above. And if you don't like the default self-controled
> mode, you can change it via sysfs attributes on the trigger.
>=20
> It would also allow the user to switch between SW and HW control,
> without having to remember the previous HW triggering mode, because
> that could be persisted by the LED HW trigger device. So you can go
> back to previous HW triggering mode just by 'echo hw-trigger >
> your-led/trigger'.
>=20
> I've read through the discussions, and this seems like a workable
> interface.
>=20
> Most of the LED devices would just add one extra private trigger to
> the triggers_list, so it would not explode in the way you describe
> above.
>=20
> Also benefit of this approach is that it fits quite nicely with the
> existing code, and requires minimal changes. The trigger already
> allows for specifying sysfs attributes, too.
>=20
> regards,
> 	o.
