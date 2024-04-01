Return-Path: <linux-leds+bounces-1384-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C78936C0
	for <lists+linux-leds@lfdr.de>; Mon,  1 Apr 2024 03:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D1CAB2128A
	for <lists+linux-leds@lfdr.de>; Mon,  1 Apr 2024 01:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E11C17FD;
	Mon,  1 Apr 2024 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyFOkA0n"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E5EC2
	for <linux-leds@vger.kernel.org>; Mon,  1 Apr 2024 01:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711935616; cv=none; b=LaHP8lL/m/EwDRb19FwbAL4H30vXim8vqy8cHCPzgbkjQpckE76gmUKUAcmDA86ebPBBmyDD1lI2pkd/dgrVla/nRIg9dyyxUPNLX4/V0YMQtc1hs6bCNxmu4NGh9/Y9/C+4a5BRnyROUXDag+tS4UcJfsKKd+NPLx+1r1zH/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711935616; c=relaxed/simple;
	bh=CVvjRkKEQ1K8GZwwAs6XND1VVBqZ3gscg8qbSw1O88Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDyrSqjDIFQmaN8C1dtI6FvoQYqtrMpaLMNnHbw/N9FNp83rz+XZYLAyNzosGeiUtnInIMulC65XgIdwV0geltU+MAmOLkW9RXzfhM/LjaINY2ybtXBpVU7SMxSsDkqTe8pHcERlgvKi31ACQABF2xu6bNznsfpj77BPWL64FaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyFOkA0n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711935613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBzwZVE6/XZJhG9lhNuBo21FIhFKpdiDUdcBLxSjjtE=;
	b=UyFOkA0nLKjU4Pxr6LprSsmMqO276xw0Qt7acLnHns87fUU7KIJ+yi+LTDUsO7WUHwYYQQ
	+a0XY+YegOEir7XREWO8gW+l/sbIJ9wnfAQKCx82CsMJF1a8M5BUmfL3a0cUtHJ2G6SQlB
	eQ2SlgbSCus5meCImu1NxqDZ55p5rTI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-MRk_LaWwPOayBfGUESEk2g-1; Sun, 31 Mar 2024 21:40:11 -0400
X-MC-Unique: MRk_LaWwPOayBfGUESEk2g-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1e0b3a4c2e4so17890855ad.0
        for <linux-leds@vger.kernel.org>; Sun, 31 Mar 2024 18:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711935610; x=1712540410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBzwZVE6/XZJhG9lhNuBo21FIhFKpdiDUdcBLxSjjtE=;
        b=bEOu0Bkhw/I+Cr2O6M2BcYSWjRkU+xQKd77zM1hlF+Ag+VBzMvcTILoQS1n9SIdmDm
         P7f77LH3iCbtvhT+UXI4D/gzIFyylq5wCfoQKVqhh+yI7c4j9rkTmUfgV+0MK3y2Dwvl
         mRqZ1tTBEVSU/H0vw1CrOKjIUq93F0t1H2xmb/fpgNtk60n8efnCwpV+PiXcQXMiHG46
         iAOm9sIovu5Sc5niRGzZyRijc0Z5dSzbelWOhMBValLcoJx+lBgKjnIeA2ZLVM9HSrFU
         xlruuVqQdj8li0lajGGi29dFPKGBMzrzHALkh3+j2q+sv6j8Ab3dKdE/vxdVRUuNIC5S
         A6CA==
X-Forwarded-Encrypted: i=1; AJvYcCU44FxWt+MgEUypZVsaTsl83JBfrCEe8rF8CebTo3+0IYKbt9opLqJMoqvfjd82UCkniVb30vlkewQWT1eG2aiQQGcXIGAB+el/Yw==
X-Gm-Message-State: AOJu0Yyi0HzYXjVYpEKUUL5y50w9eV+EO526HaIF/tGUgckrIvul7pPY
	BNT5e27Cazjh/D9IVZQmLc2Uej+An17s7R2Lr0UVFXobMN4m89ZB2GyqvDHcLp7YgTV4AL1gyL6
	VaHnK6p8A5kvg1oO2NuEfNmXmeDXMvco7bb8n/vu9rBPTR0GXaK9IT0dN97kBOlB63VGuZSDeix
	Pe7QfsyhdyYiHaBZG1kI/VTw+fM952fpGPhg==
X-Received: by 2002:a17:902:7005:b0:1e0:a3dd:82df with SMTP id y5-20020a170902700500b001e0a3dd82dfmr6524530plk.38.1711935610177;
        Sun, 31 Mar 2024 18:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOam+CBLcJgkKx62NYgxq8ze9IbSjrgmvGMm3dvSXCb5VwSU29/cplx6cbZS3eX9jokod62DqaTZD9RRyNze8=
X-Received: by 2002:a17:902:7005:b0:1e0:a3dd:82df with SMTP id
 y5-20020a170902700500b001e0a3dd82dfmr6524516plk.38.1711935609797; Sun, 31 Mar
 2024 18:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-6-hpa@redhat.com>
 <nakbogrilul6skiab5opfsqhhqfotfgmb47wyd3xbgbpf6hurc@6xshfz3obj7m>
In-Reply-To: <nakbogrilul6skiab5opfsqhhqfotfgmb47wyd3xbgbpf6hurc@6xshfz3obj7m>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 1 Apr 2024 09:39:51 +0800
Message-ID: <CAEth8oE21tdcEgb9K_d7cY=nBaazkVvcBg2piQeALwRiB2eY+w@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 5/6] power: supply: power-supply-leds: Add
 charging_red_full_green trigger for RGB LED
To: Sebastian Reichel <sre@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Mar 30, 2024 at 12:24=E2=80=AFAM Sebastian Reichel <sre@kernel.org>=
 wrote:
>
> Hello Kate,
>
> On Sun, Mar 24, 2024 at 11:01:06PM +0800, Kate Hsuan wrote:
> > Add a charging_red_full_green LED trigger and the trigger is based on
> > led_mc_trigger_event() which can set an RGB LED when the trigger is
> > triggered. The LED will show red when the battery status is charging.
> > The LED will show green when the battery status is full.
> >
> > Link: https://lore.kernel.org/linux-leds/f40a0b1a-ceac-e269-c2dd-0158c5=
b4a1ad@gmail.com/T/#t
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
>
> Have you considered using orange instead of red? Using orange as
> charging indicator seems to be more common nowadays and allows

Sounds good.
I'll change the color for them.

Thank you

>
> green  =3D battery full
> orange =3D battery charging
> red    =3D battery empty / battery dead / error
>
> Greetings,
>
> -- Sebastian
>
> >  drivers/power/supply/power_supply_leds.c | 25 ++++++++++++++++++++++++
> >  include/linux/power_supply.h             |  2 ++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/s=
upply/power_supply_leds.c
> > index c7db29d5fcb8..bd9c8fec5870 100644
> > --- a/drivers/power/supply/power_supply_leds.c
> > +++ b/drivers/power/supply/power_supply_leds.c
> > @@ -22,6 +22,8 @@
> >  static void power_supply_update_bat_leds(struct power_supply *psy)
> >  {
> >       union power_supply_propval status;
> > +     unsigned int intensity_green[3] =3D {255, 0, 0};
> > +     unsigned int intensity_red[3] =3D {0, 0, 255};
> >
> >       if (power_supply_get_property(psy, POWER_SUPPLY_PROP_STATUS, &sta=
tus))
> >               return;
> > @@ -36,12 +38,20 @@ static void power_supply_update_bat_leds(struct pow=
er_supply *psy)
> >               /* Going from blink to LED on requires a LED_OFF event to=
 stop blink */
> >               led_trigger_event(psy->charging_blink_full_solid_trig, LE=
D_OFF);
> >               led_trigger_event(psy->charging_blink_full_solid_trig, LE=
D_FULL);
> > +             led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                  intensity_green,
> > +                                  3,
> > +                                  LED_FULL);
> >               break;
> >       case POWER_SUPPLY_STATUS_CHARGING:
> >               led_trigger_event(psy->charging_full_trig, LED_FULL);
> >               led_trigger_event(psy->charging_trig, LED_FULL);
> >               led_trigger_event(psy->full_trig, LED_OFF);
> >               led_trigger_blink(psy->charging_blink_full_solid_trig, 0,=
 0);
> > +             led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                  intensity_red,
> > +                                  3,
> > +                                  LED_FULL);
> >               break;
> >       default:
> >               led_trigger_event(psy->charging_full_trig, LED_OFF);
> > @@ -49,6 +59,10 @@ static void power_supply_update_bat_leds(struct powe=
r_supply *psy)
> >               led_trigger_event(psy->full_trig, LED_OFF);
> >               led_trigger_event(psy->charging_blink_full_solid_trig,
> >                       LED_OFF);
> > +             led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                  intensity_red,
> > +                                  3,
> > +                                  LED_OFF);
> >               break;
> >       }
> >  }
> > @@ -74,6 +88,11 @@ static int power_supply_create_bat_triggers(struct p=
ower_supply *psy)
> >       if (!psy->charging_blink_full_solid_trig_name)
> >               goto charging_blink_full_solid_failed;
> >
> > +     psy->charging_red_full_green_trig_name =3D kasprintf(GFP_KERNEL,
> > +             "%s-charging-red-full-green", psy->desc->name);
> > +     if (!psy->charging_red_full_green_trig_name)
> > +             goto charging_red_full_green_failed;
> > +
> >       led_trigger_register_simple(psy->charging_full_trig_name,
> >                                   &psy->charging_full_trig);
> >       led_trigger_register_simple(psy->charging_trig_name,
> > @@ -82,9 +101,13 @@ static int power_supply_create_bat_triggers(struct =
power_supply *psy)
> >                                   &psy->full_trig);
> >       led_trigger_register_simple(psy->charging_blink_full_solid_trig_n=
ame,
> >                                   &psy->charging_blink_full_solid_trig)=
;
> > +     led_trigger_register_simple(psy->charging_red_full_green_trig_nam=
e,
> > +                                 &psy->charging_red_full_green_trig);
> >
> >       return 0;
> >
> > +charging_red_full_green_failed:
> > +     kfree(psy->charging_blink_full_solid_trig_name);
> >  charging_blink_full_solid_failed:
> >       kfree(psy->full_trig_name);
> >  full_failed:
> > @@ -101,10 +124,12 @@ static void power_supply_remove_bat_triggers(stru=
ct power_supply *psy)
> >       led_trigger_unregister_simple(psy->charging_trig);
> >       led_trigger_unregister_simple(psy->full_trig);
> >       led_trigger_unregister_simple(psy->charging_blink_full_solid_trig=
);
> > +     led_trigger_unregister_simple(psy->charging_red_full_green_trig);
> >       kfree(psy->charging_blink_full_solid_trig_name);
> >       kfree(psy->full_trig_name);
> >       kfree(psy->charging_trig_name);
> >       kfree(psy->charging_full_trig_name);
> > +     kfree(psy->charging_red_full_green_trig_name);
> >  }
> >
> >  /* Generated power specific LEDs triggers. */
> > diff --git a/include/linux/power_supply.h b/include/linux/power_supply.=
h
> > index c0992a77feea..1d7c0b43070f 100644
> > --- a/include/linux/power_supply.h
> > +++ b/include/linux/power_supply.h
> > @@ -318,6 +318,8 @@ struct power_supply {
> >       char *online_trig_name;
> >       struct led_trigger *charging_blink_full_solid_trig;
> >       char *charging_blink_full_solid_trig_name;
> > +     struct led_trigger *charging_red_full_green_trig;
> > +     char *charging_red_full_green_trig_name;
> >  #endif
> >  };
> >
> > --
> > 2.44.0
> >
> >



--=20
BR,
Kate


