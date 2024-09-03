Return-Path: <linux-leds+bounces-2587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26026969A7F
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 583171C20E85
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536919CC27;
	Tue,  3 Sep 2024 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFQlQkvt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA101A0BEB
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360389; cv=none; b=HswUJ3DnmXTLkAwxSDOSR2dP3zyXFnVahLvKNP2Kp6hvhUDNBGQNhOWa1I9IIT1gkj2hNP/J3k3B91F9wBw1jpK795WlqG8/yOzVtr9lbSOkA+839QM7XCPCDOpVfqT8tcWtg6hEw0Zre0ZFoD2rKjOV6sowSY1xepf9ZYKsa+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360389; c=relaxed/simple;
	bh=2PcpiEi1R4HpRrnRAu5ItTv4dv+zH4A4BzLfB8vRbcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEPSk5u5j2OvEPNHBPqNSNev2Ogtla2oW98EoBTsXigClT+zZ5Gutck5CQBaugJgzyHC8WLPySKnu28uKvhxwgPLGD66MVYInXbL6D1y2ISDATnd5XIvdrIXkH6ItPEpMXEbKL/v6k2mqp2tBXyY4+azLP1V+5PCbzujlT6FKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFQlQkvt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a868831216cso593232866b.3
        for <linux-leds@vger.kernel.org>; Tue, 03 Sep 2024 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725360386; x=1725965186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwQxyK0ht6uxgVzN3BuGz8T+YN66iIRcYmjlriP9FTM=;
        b=LFQlQkvt7IuX42DrmsvidOSQ8yXlXvLs79jmUA7GIoOSUesYl5b+VkoyTWyQgb4VyU
         nc9c65kefNhTwz9czWv8V9vCBHcL+75+tQ2X/+lWB8WbMn/d6NZ3X/E/6aqXQ92fsm83
         90phYhUsivKSamYyzIwpE7EC21U9kRPL16s4tb3hVZoobcgvv5T/66HBOTm2KZ2ysQ/K
         xCKHnKwMoUDY+S7Cq34rYqt3Ko8WcnBlIuilN9WjOOXtsdBvPBhmz7RSJVGJplNNBcWI
         AfZZVIRVkXgB+t9Cvq85o/6KKjjo2dUTPSXQowR6EGc3UKgK+nwXuQEKE+nh7uWqaci+
         FQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360386; x=1725965186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwQxyK0ht6uxgVzN3BuGz8T+YN66iIRcYmjlriP9FTM=;
        b=Dyj830dTOgSPMKiIxcOl9GC3tiOQTGoxcaN6Q+dIScMi3aCp26kIu1cMIV0typkmFK
         Rl16AbSVU836AcrCbuKEWqAiuspT3mGZQnYuJB2kPcyiW5ZH/OL2Z0P3BmVXRLYfRxNh
         XSUrxPY+tkBXYE0O3SgmB5qWtHgUmEyM2rlkpMxeyHRlmF4YaG6uUspYb2+DydGYjc+t
         kD6Q6DyzAyPQ9iDfLyeSRuV6kTItJraqcvpzhSPuk3BrsKJUEcPCbhmTYc9gs48ui+56
         5eF7MAMdv13neZIeCKPz/W/oelLX/RKdxBiwS0mNFE16KP//As2VXgyGXHA0FR5J3qln
         8nPA==
X-Forwarded-Encrypted: i=1; AJvYcCVVmPZcpoHIm6tDMJU8mQB9T4QNPFq/FQOHh1AA1uC+/mvaP881kEMxuiLZ9CLz1Di2hiK8PPQVo4d1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9iSaHMbh+48dy/ljvqT2aucwrEXPjC8R7T8UP875hykmQd28a
	XBC6T5oQ/sS9WdvEh0BP1IeEJ0hylKpo7JXdLZHl3dbZtrWWjrNXZ6Mg4TNaOMpO6CN65pE6i7I
	fhYfAnM2FCVxHoRBgIC1Knw4vjvg=
X-Google-Smtp-Source: AGHT+IE9NSYpni2EvkWTHxFmIVGuACZ10gRDVb8GLbO50DX7tFOE+e7dOu2U5anNiYtp1oAsZ3T1tkScx4dZID4OGyc=
X-Received: by 2002:a17:907:3f24:b0:a86:78fd:1df3 with SMTP id
 a640c23a62f3a-a89b972ba01mr652239866b.59.1725360385545; Tue, 03 Sep 2024
 03:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903101930.16251-1-kabel@kernel.org> <20240903101930.16251-9-kabel@kernel.org>
In-Reply-To: <20240903101930.16251-9-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 13:45:49 +0300
Message-ID: <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:20=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Use dev_err_probe() instead of dev_err() + separate return where
> appropriate.

...

> +       if (ret)
> +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to so=
ftware mode\n", np);

Side note: Not sure how np is being used besides the messaging. If
it's only for the messaging, I would rather see %pfw and fwnode based
approach.

...

>         count =3D of_get_available_child_count(np);
> -       if (!count) {
> -               dev_err(dev, "LEDs are not defined in device tree!\n");
> -               return -ENODEV;
> -       } else if (count > OMNIA_BOARD_LEDS) {
> -               dev_err(dev, "Too many LEDs defined in device tree!\n");
> -               return -EINVAL;
> -       }
> +       if (!count)

Dunno if 'if (count =3D=3D 0)' would look better from the readability persp=
ective.

> +               return dev_err_probe(dev, -ENODEV, "LEDs are not defined =
in device tree!\n");
> +       else if (count > OMNIA_BOARD_LEDS)

Even in the original code the 'else' is redundant.

> +               return dev_err_probe(dev, -EINVAL, "Too many LEDs defined=
 in device tree!\n");

--=20
With Best Regards,
Andy Shevchenko

