Return-Path: <linux-leds+bounces-7273-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKHFKmYnsWkBrgIAu9opvQ
	(envelope-from <linux-leds+bounces-7273-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 09:27:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765625F3B6
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 09:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A325D306B144
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 08:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7BC3B27C6;
	Wed, 11 Mar 2026 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTxAwK4h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550E373BFB
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216891; cv=pass; b=fC8HPzWjW70JgVi4HAc1lB8QUvRHO/6pbbXyIjGTDWPiH//wFzNvzoB418FuXcrS7fjx2Y2rdd1fGdJQFX7AhxcYG5r924FAAyIOqMRB9BN++AnmUYQW66SDqg+PzPma3oHMHHUOLbD0bN4C19BXUZJhy7jacBrPCW3CW/gNTrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216891; c=relaxed/simple;
	bh=u4CdfaREWtCFsjybp9S/jYOJyIP4ewIw1l8bNkyMQ/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnEVwuqHNvAZ2jAsHpXrKJSbyxgc9G9L6hUJg9lIK0hsRlubTcNLSOn7o5B80QiXl3jI9D+ee/6ZLh7KvqYOtK1TmzK+KqJYvHDOlpNuYxnlYAo6rUVeq7wWGLxfDqdzZZBzw53a7cAIdrimmmpYSp+iCEEUmjVEXYnvR3Y6Bls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTxAwK4h; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso7757016f8f.3
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 01:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773216888; cv=none;
        d=google.com; s=arc-20240605;
        b=jG/fO9Hgqr62wTnTrab9To2e5MQMagL9v7TmBTXh1AmeUoE7+5N6GCtG3IwqkESrya
         WKAxKKqCPWbbBEeklrUlWudZKQqeXIqiSB+28kD4R8td2AA7xZsJPGucSXemoXBG0sUx
         rIjCUmRRemD/kVYvO/HCVN96bxUwrk4ZhPs+60jpRpUhHtz6Pi9VGYFP7SUmZ/fPBkSS
         eNB4nVH/aWtQXyeSqM/MLUSWryNifJUS/aRenf5napP7bgFyRTU9aoSA3RaDfiH2YDcD
         Kik9eYACNxMFvvb33hzo0Lr9gAwAXfCdQbTafrMHqutibqi1lFXV6bPhcxhARJXA/DY0
         HcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9rNAXdNcxSuk4U8PQam5ZhqyabLIIwpshht9Wf0q1ow=;
        fh=RebgQAy6lcOaClrqAAFD6b/0PzJyzy2qzLnX5p92das=;
        b=ES/RQsptLJS1RvM6nK6U8QLhhHSiqNqVW9ghLxPDPqZzgsp50bJYdJ60qQ/+5/JNhy
         CqbBGfI9AkjsW5PpCiTjhLImkjwQP/LgW668YGn06C6qdzO3Me7tcdyvwtivJxf5nY+R
         5zBYSL9MCcMow2Qpw/vxi8q8Jf2wSP2l55K9K6xlinwxqk8ow8OJWP06QRl1m6BkxgjJ
         iKj48fFRYwHV6jHb1zXNONY9EC7vSMauTCB/7lCRHzLo3p8Hr8JHb9o/ZxJG0wp9dPBG
         7BvJXcvjhboFZ29HABaDUdW0+2DXroqbfc4bEO/+8gHAuzbXCDxpNUGIXJbV0s2ULOfx
         RcSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773216888; x=1773821688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rNAXdNcxSuk4U8PQam5ZhqyabLIIwpshht9Wf0q1ow=;
        b=XTxAwK4hdm0CKBY8iMs+7Pg+BZNxh1jwN+tw7OQi9fUs9ghY/mpA/9sHcKkFHu+KQu
         W5yah354S8osNwHFzVB8pWbTlRZ25CHER9hFeKE4+z/qgYU8yZpcv5SsYVwleNoyMJfj
         rFnkzw/QUPjov55+HbiLcA3DCpMffdkClrRfU9CVGXOerq4EpPkvYcQUuWkGImtS2dEI
         ORwHS7KCIBv3uDsmTqNfbEwUfxTEevRNMUU3juwWLiW3Ua/Eipa8XmnpnbKxziB6Xlo2
         Shv/4QKuRKoybI8SU3LshnwhfteZ5J0mpn0edaFEPnfwVZyXPxH/GP5lxT5Wrnjf7jYR
         vfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216888; x=1773821688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rNAXdNcxSuk4U8PQam5ZhqyabLIIwpshht9Wf0q1ow=;
        b=cZg/sGvmR2t0US5/+pKqnUlBR63t3yLD75I9rBBwUqNrVjHAg7E2M2GgcEA4BWhw3i
         BR/tRyx8RuQ59fMY7lLNWB/vzoGrHvaRTj73gQZQiOvAVFz2Bl0VhPtYQ8zAHHeUDBcu
         N4Mmur1KCLLQ9CieSJMcKM+ZzG9VoFkBlL9JorCunL3P8pGSVHJ7JN8O4pMrxCHO9FGx
         abjX/q+xm/vwaw4Bsrn4XAUxw/nZuLUq31vfSTVuHurJilv+IIeiYtXJrmiexfNNcqU+
         JGe+0q4tAPm/SmXukpj/V7ll5KWowsXPuHKQ//8uPuOiObTFavA3lc5wD4bTwpoXQBRo
         tm3w==
X-Forwarded-Encrypted: i=1; AJvYcCW7PjPrMHkBVg5o8WuxWswTeigpnQDxI4po2GdAJk3Lse2u6QU/A02eZDCT24F41gD5fQqG/XpHWa7X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rq1GYwZbbE4p6ARhUBgZ0KOnAfBSgPmLIgKeambygRv4Cd87
	uONOmHZf6vw8mNgX9Vck1MzGxie1mvdcvpPdekOddugQSTHg268Yn4FLHb7+xf4r4Sg72knSr9E
	Ti35Sqo0Ulbe0RLLrE+MDeZdKDKhzf9k=
X-Gm-Gg: ATEYQzxkWCIwwllYGjepqC9PazBukd7wno1wm6d70BDeS/bEckYGwFSJ7yAM9r6mJCf
	TUD8tuS/syCwThCe05saRurOZ5dD9cykfyZZGB0r0L0UGomzemIBB0GYzf16Zi+0awng5NLZR//
	oYh7J9PqcFkHy0AtYb+IJsdOU6d2ixB/WYWyL/hg4PIICli545SMBN/qikSvvi2lU2l30vBmOZc
	zgf/YYR0iGs2EzIzwn9qubKPcYsn6colViHtkw3/X33Ev/Hua6MUUdJ+72zP3KFb1WGqtCNKwbQ
	9gdSKNLwG8RYvM+MDOQ=
X-Received: by 2002:a5d:64e7:0:b0:439:d935:87c0 with SMTP id
 ffacd0b85a97d-439f81c7711mr3046234f8f.17.1773216888102; Wed, 11 Mar 2026
 01:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304185751.83494-1-clamor95@gmail.com> <20260304185751.83494-7-clamor95@gmail.com>
 <abELVIzUrWmno8cX@venus>
In-Reply-To: <abELVIzUrWmno8cX@venus>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Mar 2026 10:14:35 +0200
X-Gm-Features: AaiRm51VIbCLmJkF_SfGtr8Ik4Sh0FSFckAXCdy_Krd5I0kJFReGN7kNzMtc9Ek
Message-ID: <CAPVz0n26Nq2v3dwaeXavVw28Awbyi=Q_4L3rmJLyGDkD9y3UXA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] power: supply: Add driver for ASUS Transformer battery
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5765625F3B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7273-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qmqm.pl:email,mail.gmail.com:mid,poll_work.work:url,collabora.com:email]
X-Rspamd-Action: no action

=D1=81=D1=80, 11 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 08:31 Seba=
stian Reichel
<sebastian.reichel@collabora.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Wed, Mar 04, 2026 at 08:57:50PM +0200, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Driver implements one battery cell per EC controller and supports readi=
ng
> > of battery status for ASUS Transformer's pad and mobile dock.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/power/supply/Kconfig                  |  11 +
> >  drivers/power/supply/Makefile                 |   1 +
> >  .../supply/asus-transformer-ec-battery.c      | 272 ++++++++++++++++++
> >  3 files changed, 284 insertions(+)
> >  create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
> >
> > diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfi=
g
> > index 81fadb0695a9..3c46b412632d 100644
> > --- a/drivers/power/supply/Kconfig
> > +++ b/drivers/power/supply/Kconfig
> > @@ -122,6 +122,17 @@ config BATTERY_CHAGALL
> >         This driver can also be built as a module. If so, the module wi=
ll be
> >         called chagall-battery.
> >
> > +config BATTERY_ASUS_TRANSFORMER_EC
> > +     tristate "Asus Transformer's battery driver"
> > +     depends on MFD_ASUS_TRANSFORMER_EC
> > +     help
> > +       Say Y here to enable support APM status emulation using
> > +       battery class devices.
>
> ^^^
>
> You forgot to drop that when you used the APM_POWER config entry as
> template. Otherwise the driver LGTM:
>

Oh, my bad. I will adjust in the next iteration. Thank you catching this.

> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>
> Greetings,
>
> -- Sebastian
>
> > +       This sub-driver supports battery cells found in Asus Transforme=
r
> > +       tablets and mobile docks and controlled by special embedded
> > +       controller.
> > +
> >  config BATTERY_CPCAP
> >       tristate "Motorola CPCAP PMIC battery driver"
> >       depends on MFD_CPCAP && IIO
> > diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makef=
ile
> > index 41c400bbf022..aa5e6b05b018 100644
> > --- a/drivers/power/supply/Makefile
> > +++ b/drivers/power/supply/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_TEST_POWER)    +=3D test_power.o
> >  obj-$(CONFIG_BATTERY_88PM860X)       +=3D 88pm860x_battery.o
> >  obj-$(CONFIG_CHARGER_ADP5061)        +=3D adp5061.o
> >  obj-$(CONFIG_BATTERY_ACT8945A)       +=3D act8945a_charger.o
> > +obj-$(CONFIG_BATTERY_ASUS_TRANSFORMER_EC)    +=3D asus-transformer-ec-=
battery.o
> >  obj-$(CONFIG_BATTERY_AXP20X) +=3D axp20x_battery.o
> >  obj-$(CONFIG_CHARGER_AXP20X) +=3D axp20x_ac_power.o
> >  obj-$(CONFIG_BATTERY_CHAGALL)        +=3D chagall-battery.o
> > diff --git a/drivers/power/supply/asus-transformer-ec-battery.c b/drive=
rs/power/supply/asus-transformer-ec-battery.c
> > new file mode 100644
> > index 000000000000..aefcd3fed6fe
> > --- /dev/null
> > +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> > @@ -0,0 +1,272 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/devm-helpers.h>
> > +#include <linux/err.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/power_supply.h>
> > +#include <linux/property.h>
> > +#include <linux/unaligned.h>
> > +
> > +#define ASUSEC_BATTERY_DATA_FRESH_MSEC               5000
> > +
> > +#define ASUSEC_BATTERY_DISCHARGING           0x40
> > +#define ASUSEC_BATTERY_FULL_CHARGED          0x20
> > +#define ASUSEC_BATTERY_NOT_CHARGING          0x10
> > +
> > +#define TEMP_CELSIUS_OFFSET                  2731
> > +
> > +struct asus_ec_battery_data {
> > +     const struct asusec_info *ec;
> > +     struct power_supply *battery;
> > +     struct power_supply_desc psy_desc;
> > +     struct delayed_work poll_work;
> > +     struct mutex battery_lock; /* for data refresh */
> > +     unsigned long batt_data_ts;
> > +     int last_state;
> > +     u8 batt_data[DOCKRAM_ENTRY_BUFSIZE];
> > +};
> > +
> > +static int asus_ec_battery_refresh(struct asus_ec_battery_data *priv)
> > +{
> > +     int ret =3D 0;
> > +
> > +     guard(mutex)(&priv->battery_lock);
> > +
> > +     if (time_before(jiffies, priv->batt_data_ts))
> > +             return ret;
> > +
> > +     ret =3D asus_dockram_read(priv->ec->dockram, ASUSEC_DOCKRAM_BATT_=
CTL,
> > +                             priv->batt_data);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     priv->batt_data_ts =3D jiffies +
> > +             msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC);
> > +
> > +     return ret;
> > +}
> > +
> > +static enum power_supply_property asus_ec_battery_properties[] =3D {
> > +     POWER_SUPPLY_PROP_STATUS,
> > +     POWER_SUPPLY_PROP_VOLTAGE_MAX,
> > +     POWER_SUPPLY_PROP_CURRENT_MAX,
> > +     POWER_SUPPLY_PROP_TEMP,
> > +     POWER_SUPPLY_PROP_VOLTAGE_NOW,
> > +     POWER_SUPPLY_PROP_CURRENT_NOW,
> > +     POWER_SUPPLY_PROP_CAPACITY,
> > +     POWER_SUPPLY_PROP_CHARGE_NOW,
> > +     POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
> > +     POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
> > +     POWER_SUPPLY_PROP_PRESENT,
> > +};
> > +
> > +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> > +     [POWER_SUPPLY_PROP_STATUS] =3D 1,
> > +     [POWER_SUPPLY_PROP_VOLTAGE_MAX] =3D 3,
> > +     [POWER_SUPPLY_PROP_CURRENT_MAX] =3D 5,
> > +     [POWER_SUPPLY_PROP_TEMP] =3D 7,
> > +     [POWER_SUPPLY_PROP_VOLTAGE_NOW] =3D 9,
> > +     [POWER_SUPPLY_PROP_CURRENT_NOW] =3D 11,
> > +     [POWER_SUPPLY_PROP_CAPACITY] =3D 13,
> > +     [POWER_SUPPLY_PROP_CHARGE_NOW] =3D 15,
> > +     [POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW] =3D 17,
> > +     [POWER_SUPPLY_PROP_TIME_TO_FULL_NOW] =3D 19,
> > +};
> > +
> > +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv=
,
> > +                                  enum power_supply_property psp)
> > +{
> > +     int ret, offs;
> > +
> > +     if (psp >=3D ARRAY_SIZE(asus_ec_battery_prop_offs))
> > +             return -EINVAL;
> > +
> > +     offs =3D asus_ec_battery_prop_offs[psp];
> > +     if (!offs)
> > +             return -EINVAL;
> > +
> > +     ret =3D asus_ec_battery_refresh(priv);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (offs >=3D priv->batt_data[0])
> > +             return -ENODATA;
> > +
> > +     return get_unaligned_le16(priv->batt_data + offs);
> > +}
> > +
> > +static int asus_ec_battery_get_property(struct power_supply *psy,
> > +                                     enum power_supply_property psp,
> > +                                     union power_supply_propval *val)
> > +{
> > +     struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(ps=
y);
> > +     int ret;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_PRESENT:
> > +             val->intval =3D 1;
> > +             break;
> > +
> > +     default:
> > +             ret =3D asus_ec_battery_get_value(priv, psp);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             val->intval =3D (s16)ret;
> > +
> > +             switch (psp) {
> > +             case POWER_SUPPLY_PROP_STATUS:
> > +                     if (ret & ASUSEC_BATTERY_FULL_CHARGED)
> > +                             val->intval =3D POWER_SUPPLY_STATUS_FULL;
> > +                     else if (ret & ASUSEC_BATTERY_NOT_CHARGING)
> > +                             val->intval =3D POWER_SUPPLY_STATUS_NOT_C=
HARGING;
> > +                     else if (ret & ASUSEC_BATTERY_DISCHARGING)
> > +                             val->intval =3D POWER_SUPPLY_STATUS_DISCH=
ARGING;
> > +                     else
> > +                             val->intval =3D POWER_SUPPLY_STATUS_CHARG=
ING;
> > +                     break;
> > +
> > +             case POWER_SUPPLY_PROP_TEMP:
> > +                     val->intval -=3D TEMP_CELSIUS_OFFSET;
> > +                     break;
> > +
> > +             case POWER_SUPPLY_PROP_CHARGE_NOW:
> > +             case POWER_SUPPLY_PROP_CURRENT_NOW:
> > +             case POWER_SUPPLY_PROP_CURRENT_MAX:
> > +             case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> > +             case POWER_SUPPLY_PROP_VOLTAGE_MAX:
> > +                     val->intval *=3D 1000;
> > +                     break;
> > +
> > +             case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> > +             case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> > +                     val->intval *=3D 60;
> > +                     break;
> > +
> > +             default:
> > +                     break;
> > +             }
> > +
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void asus_ec_battery_poll_work(struct work_struct *work)
> > +{
> > +     struct asus_ec_battery_data *priv =3D
> > +             container_of(work, struct asus_ec_battery_data, poll_work=
.work);
> > +     int state;
> > +
> > +     state =3D asus_ec_battery_get_value(priv, POWER_SUPPLY_PROP_STATU=
S);
> > +     if (state < 0)
> > +             return;
> > +
> > +     if (state & ASUSEC_BATTERY_FULL_CHARGED)
> > +             state =3D POWER_SUPPLY_STATUS_FULL;
> > +     else if (state & ASUSEC_BATTERY_DISCHARGING)
> > +             state =3D POWER_SUPPLY_STATUS_DISCHARGING;
> > +     else
> > +             state =3D POWER_SUPPLY_STATUS_CHARGING;
> > +
> > +     if (priv->last_state !=3D state) {
> > +             priv->last_state =3D state;
> > +             power_supply_changed(priv->battery);
> > +     }
> > +
> > +     /* continuously send uevent notification */
> > +     schedule_delayed_work(&priv->poll_work,
> > +                           msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_=
MSEC));
> > +}
> > +
> > +static const struct power_supply_desc asus_ec_battery_desc =3D {
> > +     .name =3D "asus-ec-battery",
> > +     .type =3D POWER_SUPPLY_TYPE_BATTERY,
> > +     .properties =3D asus_ec_battery_properties,
> > +     .num_properties =3D ARRAY_SIZE(asus_ec_battery_properties),
> > +     .get_property =3D asus_ec_battery_get_property,
> > +     .external_power_changed =3D power_supply_changed,
> > +};
> > +
> > +static int asus_ec_battery_probe(struct platform_device *pdev)
> > +{
> > +     struct asus_ec_battery_data *priv;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct power_supply_config cfg =3D { };
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     mutex_init(&priv->battery_lock);
> > +
> > +     priv->ec =3D cell_to_ec(pdev);
> > +     priv->batt_data_ts =3D jiffies - 1;
> > +     priv->last_state =3D POWER_SUPPLY_STATUS_UNKNOWN;
> > +
> > +     cfg.fwnode =3D dev_fwnode(dev->parent);
> > +     cfg.drv_data =3D priv;
> > +
> > +     memcpy(&priv->psy_desc, &asus_ec_battery_desc, sizeof(priv->psy_d=
esc));
> > +     priv->psy_desc.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-batte=
ry",
> > +                                          priv->ec->name);
> > +
> > +     priv->battery =3D devm_power_supply_register(dev, &priv->psy_desc=
, &cfg);
> > +     if (IS_ERR(priv->battery))
> > +             return dev_err_probe(dev, PTR_ERR(priv->battery),
> > +                                  "Failed to register power supply\n")=
;
> > +
> > +     ret =3D devm_delayed_work_autocancel(dev, &priv->poll_work,
> > +                                        asus_ec_battery_poll_work);
> > +     if (ret)
> > +             return ret;
> > +
> > +     schedule_delayed_work(&priv->poll_work,
> > +                           msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_=
MSEC));
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused asus_ec_battery_suspend(struct device *dev)
> > +{
> > +     struct asus_ec_battery_data *priv =3D dev_get_drvdata(dev);
> > +
> > +     cancel_delayed_work_sync(&priv->poll_work);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused asus_ec_battery_resume(struct device *dev)
> > +{
> > +     struct asus_ec_battery_data *priv =3D dev_get_drvdata(dev);
> > +
> > +     schedule_delayed_work(&priv->poll_work,
> > +                           msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_=
MSEC));
> > +
> > +     return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(asus_ec_battery_pm_ops,
> > +                      asus_ec_battery_suspend, asus_ec_battery_resume)=
;
> > +
> > +static struct platform_driver asus_ec_battery_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "asus-transformer-ec-battery",
> > +             .pm =3D &asus_ec_battery_pm_ops,
> > +     },
> > +     .probe =3D asus_ec_battery_probe,
> > +};
> > +module_platform_driver(asus_ec_battery_driver);
> > +
> > +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("ASUS Transformer's battery driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.51.0
> >
> >

