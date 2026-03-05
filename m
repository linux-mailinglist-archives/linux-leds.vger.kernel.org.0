Return-Path: <linux-leds+bounces-7099-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOjiK3NzqWnH7AAAu9opvQ
	(envelope-from <linux-leds+bounces-7099-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 13:13:39 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B318C211639
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 13:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10A253061DA8
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35D139B4AB;
	Thu,  5 Mar 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbd8JZHx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B83976AC
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712096; cv=pass; b=Hq/7fvvxuuELm963sehS43VpDFIGoTvh/0q3ZjcB9IdPOLIKu9oDCBLrZcpCSFswDHUxW6VqRNAC8mI8vKE3eZmoJ0DamB88SsaTJOW+2b+zNHzwS1Zwu0EfIEFcEImox/xkCam5RioDVZmGiG01Vti8xoYvyMV24ln0VVSuUDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712096; c=relaxed/simple;
	bh=fJckT8yqyDP9d7bZq/BlUrMTFgunpZGJI3qIhZjTRNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=foMoNUg9BAJYB9iSlxb82Vg/gXr34kWAtj41YVjs5mvD0XoCwAVD+rmF3FMFk9fsch7zpV5FzprmJWS++YicDu8g1AHLnWssXohdRrR/19A7joQ2htWBlrDsEBQSqZH/xzczKLoIJe52n1i2npoLYrsgYcMCbva5x0lmZpQRxvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbd8JZHx; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1282bc6aaso732759e87.2
        for <linux-leds@vger.kernel.org>; Thu, 05 Mar 2026 04:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772712092; cv=none;
        d=google.com; s=arc-20240605;
        b=PQ7+mOIRKshf5oPsDEVhj3etM55ZaXRI1U//Eeu2Narp5XXMXC9rdottlezwcPMqVD
         ZwApIuzxe4nfhqzzVKAeR6jy+rvzCHlN9nMZxrSFarxJHklqPbXX6sGkBf1luOJtwXGr
         SWQ7Iza7ZFbiUZaZxObXs3WVoUtq8YK4BwEf72PFqJyvFFkURCHacvBUQE1dIltbj9sK
         WTfbhOmAUuEjUndhThjhne6+asRGsGvs5dbi6SCyCM8wOLoM5BFxcG3uUNxya/oMAR1d
         VnzzayF3wIzS4IBBOtzDU7ibV5bMOIntW/fk1uT4S1BZwO8AAGgHtN70q98+Iw5r/bTL
         6a2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        fh=i+PAveMWZuy1XfCKIQUDrZ6/KDd9gOQps5dYpNBJjjI=;
        b=BUbNPSs6Usi9kvHEnvO8ONlqGMjFGiSUE91UgIkskCU3+FPxyF6QleUC1ooiuwhMpH
         NPMj75qAoufjBih/OJuJZa4FZBtRMqRrEOqD3qfRluT3g1NsSz+L1TCIZleaPv0g6+PJ
         XBVaGwI7dsB+zXeg8pJEexJZ8im68WlQo6itbxObgxZVjcY9Rzs+1i7QwMtrcPxfqtHC
         77x13+rWKCulVYRJKCBlc6nmY6VNW7xoDwuOs0gaMf4Jfpq9nWe9uep3+wAy+gGGotwq
         C/F4+BV6kHHdR1YYONbrWsznD0k1wCo3NDrxNc/rVhqqnbHWqKo6B7L2WGrR7hFsm7MV
         Wabw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772712092; x=1773316892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        b=Lbd8JZHxKAqNJznAJ2A0eKVjWZOT1O9mCMEhGTS+l3LwBZUeJ8PDASqWYBeR26b5Bm
         a0yoYkWVCjmvJa6I86DNCOmlMlEGbvp6A+KTpGxksF94ZxdmEvVmLBy54eU9gf1ANwhk
         T9vW8EseBq4b57y1QZ5P9JOjpZAU2uDrY7OGcKIYZ6ihcfxDPMPFI3vAdV1YKytWZ5ur
         shO3ASO7Usj9V9UXfhSW7aChO7bhcXwRn+JfZHK2biPVHz7eIQwko/Dk0MjQtvoiUp46
         vtns7GwaGR3v8GYP7BH3FalM3Ifw++cI8RQeSC2mVXMS6x58FtKGvDco21gcxoTfngBQ
         iY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712092; x=1773316892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        b=WS7wuBFoPBOhyqjesoQ15jXSXwCmohEpxg1hTBhx7uHHcKO6Hnt9ee225YsAF8WneK
         LmNQmnvFp2IJgL1bJJhY8NGBkIv2J5oyh3D27o+Co5BQZ0jvZba5kzQW6GapItVqnsTS
         TW28k/a3psfmrleIsIhEaElxEPdTyi6iIgtProAsQK20Yo7FEJgZ80Z8l9aFriUeQKe6
         k+AStHBZnLiPF/Rl74waexUm0cV9sym2ysq5qLzeUv+T/NMZz8Qzro2/4zes+2LoJm6g
         oIpsXWl3Rwll2Ts993LF4iHBeF8m429xYd/RdXmU84Azu4OEY68H+ThO7VL2wSrGFO7+
         vh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRsP+2VINvIBf5NBH5B39blhnJKp+1/qDlbrwgIZWQFr2xwPjQMIRnV6cjiVQCzpX4sqaPXkjQMx3D@vger.kernel.org
X-Gm-Message-State: AOJu0YzTuhuGfXPeJ3xOzux3H+A9QmRkyYIdBU+twnuAsQNFAz9zKSWq
	Jzjp8ugRdWsuuFrUKrbbw/Nc+jbPXW402sTIVh+h3lODDoZqFENOgCqJX+TgGDEYZzJ0SGPV63H
	jH8oFRDfmtp/5tdjtIzcMorRr5n10+6M=
X-Gm-Gg: ATEYQzxvOkxHwgRIxRfNPz27U2OFiG6HbexQWQEqSugrxjT64qwzLK3YFHQGTzQ0hqM
	WG6+zRHyG+J+Qpw3iU8TRDMO7k42715ErQrZ8IsyJJE7zO//dO8NYrsr63sge7LCFgMgYgY3wIJ
	JrPPLzERCmFNE3UulxKa5uT3RR5Ouv3IGEs7JdQYkh8JMtbH+a1/ZSu7PnbLB/JJuMdNxp7EnDg
	j03uS2eEngzU9M5yKUmXkCQ2D3s+stl7SI06K3HGZYFMPAC+Cy5KyNOgqX8VfgS+Oaq59Yl5skZ
	+0Dqss4SZSihn3xpUEtXkqyvrI4PM63pVofK+SSn
X-Received: by 2002:a05:6512:2509:b0:5a1:3207:6946 with SMTP id
 2adb3069b0e04-5a132076a97mr844258e87.33.1772712091492; Thu, 05 Mar 2026
 04:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227190617.271388-1-i@rong.moe> <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
In-Reply-To: <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 5 Mar 2026 21:00:53 +0900
X-Gm-Features: AaiRm51uv1O5U6vCPlvzY0s-1QWOok1biN3kPBxxUIId3nnM0tVkHJ4v_2WE-9k
Message-ID: <CABxCQKtnqEsjsf1BtwJnf1M3+Y82NugL+u51ruXhQ8kHNGvAJA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Rong Zhang <i@rong.moe>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B318C211639
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7099-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[rong.moe,kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnuocv@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,squebb.ca:email]
X-Rspamd-Action: no action

Hi Rong and Mark,

On Thu, Mar 5, 2026 at 5:05=E2=80=AFAM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Rong,
>
> On Fri, Feb 27, 2026, at 2:05 PM, Rong Zhang wrote:
> > Hi all,
> >
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hw control
> > trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> > through brightness levels and auto mode. For example, on ThinkBook,
> > pressing Fn+Space cycles keyboard backlight levels in the following
> > sequence:
> >
> >   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
> >
> > Recent ThinkPad models should have similar sequence too.
> >
> > However, there are some issues preventing us from using hw control
> > trigger:
> >
> > 1. We want a mechanism to tell userspace which trigger is the hw contro=
l
> >    trigger, so that userspace can determine if auto mode is on/off or
> >    turing it on/off programmatically without obtaining the hw control
> >    trigger's name via other channels
> > 2. Turing on/off auto mode via the shortcut cannot activate/deactivate
> >    the hw control trigger, making the software state out-of-sync
> > 3. Even with #1 resolved, deactivating the hw control trigger after
> >    receiving the event indicating "auto =3D> 1" has a side effect of
> >    emitting LED_OFF, breaking the shortcut cycle
> >
> > This RFC series tries to demonstrate a path on solving these issues:
> >
> > - Introduce an attribute called trigger_may_offload, so that userspace
> >    can determine:
> >    - if the LED device supports hw control (supported =3D> visible)
> >    - which trigger is the hw control trigger
> >    - if the hw control trigger is selected
> >    - if the hw control trigger is in hw control (i.e., offloaded)
> >      - A callback offloaded() is added so that LED triggers can report
> >        their hw control state
> > - Add led_trigger_notify_hw_control_changed() interface, so that LED
> >   drivers can notify the LED core about hardware initiated hw control
> >   state transitions. The LED core will then determine if the transition
> >   is allowed and turning on/off the hw control trigger accordingly
> > - Tune the logic of trigger deactivation so that it won't emit LED_OFF
> >   when the deactivation is triggered by hardware
> >
> > The last two patches are included into the RFC series to demonstrate ho=
w
> > to utilize these interfaces to add support for auto keyboard backlight
> > to ThinkBook. They will be submitted separately once the dust settles.
> >
> > Currently no Kconfig entry is provided to disable either interface. If
> > needed, I will add one later.
> >
> > [ Summary of other approaches ]
> >
> > < custom attribute >
> >
> > Pros:
> > - simplicity, KISS
> > - no need to touch the LED core
> > - extensible as long as it has a sensor-neutral name
> >   - a sensor-related name could potentially lead to a mess if a future
> >     device implements auto mode based on multiple different sensors
> >
> > Cons:
> > - must have zero influence on brightness_set[_blocking] callbacks
> >   in order not to break triggers
> >   - potential interference with triggers and the brightness attribute
> > - weird semantic (an attribute other than "brightness" and "trigger"
> >   changes the brightness)
> >
> > < hw control trigger (this series) >
> >
> > Pros:
> > - mutually exclusive with other triggers (hence less chaos)
> > - semantic correctness
> > - acts as an aggregate switch to turn on/off auto mode even a future
> >   device implements auto mode based on multiple different sensors
> >   - extensibility (through trigger attributes)
> >
> > Cons:
> > - complexity
> >
> > [ Previous discussion threads ]
> >
> > https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fast=
mail.com
> >
> > https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.came=
l@rong.moe
> >
> > Thanks,
> > Rong
> >
> > Rong Zhang (9):
> >   leds: Load trigger modules on-demand if used as hw control trigger
> >   leds: Add callback offloaded() to query the state of hw control
> >     trigger
> >   leds: cros_ec: Implement offloaded() callback for trigger
> >   leds: turris-omnia: Implement offloaded() callback for trigger
> >   leds: trigger: netdev: Implement offloaded() callback
> >   leds: Add trigger_may_offload attribute
> >   leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> >   platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
> >     backlight
> >   platform/x86: ideapad-laptop: Fully support auto kbd backlight
> >
> >  .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
> >  Documentation/ABI/testing/sysfs-class-led     |  22 ++
> >  .../testing/sysfs-class-led-trigger-netdev    |  13 --
> >  Documentation/leds/leds-class.rst             |  72 ++++++-
> >  drivers/leds/led-class.c                      |  23 +++
> >  drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
> >  drivers/leds/leds-cros_ec.c                   |   6 +
> >  drivers/leds/leds-turris-omnia.c              |   7 +
> >  drivers/leds/leds.h                           |   3 +
> >  drivers/leds/trigger/ledtrig-netdev.c         |  10 +
> >  drivers/platform/x86/lenovo/Kconfig           |   1 +
> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
> >  include/linux/leds.h                          |   6 +
> >  13 files changed, 492 insertions(+), 56 deletions(-)
> >  create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-=
netdev
> >
> >
> > base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
> > --
> > 2.51.0
>
> Thanks for your work on this.
>
> For the series: As it's a RFC, I'm not bothering with notes on any typo's=
 or grammer stuff.
>
> Overall I think the implementation works and I understand it better from =
our initial discussions. Thank you for putting this together.
>
> I'm not a huge fan of the term offloaded - I would lean towards just call=
ing it hw_control (or similar). But I see it was used in the ledtrig-netdev=
 driver so I don't feel strongly about this.
>
> Vishnu - can you check out how this would work with the Thinkpad implemen=
tation that you've been working on, please? I think that will be helpful to=
 highlight any design issues.

I will use this patch and do the changes needed for the Thinkpad and
let you know soon.


>
> Mark



--=20

Regards,

      Vishnu Sankar

