Return-Path: <linux-leds+bounces-2352-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD793FF98
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 22:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D8811F22E9F
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 20:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BA4188CCD;
	Mon, 29 Jul 2024 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsMCAbAK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449A770F6
	for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722285464; cv=none; b=KN8EoWc/nd34Z0TMLAk6lF0hJrs1sedFEUJDCV0hQTYMZsmWNQdxsuk9qj2dKcH/Q02j0kArMAz+yiTGTlRhA5DzBYaGso8KRVX3e1WOFIidW3Br13YTLfhAcnZiDuZjEAJ+aAVHDT9ShtxubJ/jlA2ACQBgXpCCXAtPiKpPsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722285464; c=relaxed/simple;
	bh=surQI8c3j4Wp/ocBd008iYeBYrAaoUaGW+6RKN2LSlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnwBobi4PqR+iNgqD1rD2zmlg1UQisMhr4yVtYvRD5Yxzjed6DddqrZEW1iKAwoxS1PT85n+HmmR1/gIRirS2tLQhN7/qnYYOwSaEidGYeIF1BRm0X8stFvaXRw3vWggOMGbs5v0KNBC5nhBVrDkfX2mDgjDmJifNpWpbV28Rj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsMCAbAK; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44feaa08040so22497321cf.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722285462; x=1722890262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvWtjh88HRkNGsK3kWpkXYb+Z9DwQhc/lhpxMCsm5cw=;
        b=jsMCAbAKlMAF7+zZPjl9PAaJguY4jBUUCD9IyzTO/mIoDzEdSrPZHlMMqO2j24fn9k
         eYxl4pCaOj9ZOoFjwUBxF8tLdpvv4FGDQ1g/0oVfi1K+vMsWDhdPsgizdhbsLfr8SvTs
         qFkiU4+VqbrjSJddHSO9UXgqEp++UVGONIuidpPTMNtkgvHzkCg+5vz3f4ygBhplvHlP
         CBgCHKh3lm0lkRTSFVVMyk/iTbH1RWWgsEqrv4QpZOkXZqZ2oLcQkXBmE/6JvqB2Z4v0
         PXE3qSsTiyhOpu5V2w0DVx4VJYF1DAq1JLKbr9BrcXjSRgH7RYpyNfOIUaSyrXOXrNoU
         woXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722285462; x=1722890262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvWtjh88HRkNGsK3kWpkXYb+Z9DwQhc/lhpxMCsm5cw=;
        b=bWNMose38VZTu1VZc56tvbPDXisu2JBtF3FLXCtZxUX0DetjaSnxolniB+qz1MrqvH
         ID6q/TUqinzFetCit7PjSWiHuwvajyQWqpEcNijuEIQ/U+DGot8Q5mcPV6LmP0AF1DX0
         bCBl8+13NOrmeYVvyBMVGJzBwYIpw7RArsjWkAkXptFgXeAP6+qJAiq0sB+0aJ8q7XSc
         HSYIR8RXLTXo6njkFfaY5lCpU1EOniQcRXXEpWnHTnKvL/RUHIXIgHpABnpqy/ygvZW6
         9Ead+ujPc1KJkE6x3lrZ+sCL9PU5t5Bm5vueq/JnqAuUKHo7xSJ5AwaGvkqlkW2K8tnJ
         Ehfg==
X-Forwarded-Encrypted: i=1; AJvYcCXEv8h3F98/MnbKNGtEG8JrouZw+9tzDSFVkWwd5CsEYRIlkyWwVXa/w4/gQaqyJKn7WUdmM/g2F/T8cqpg/ZiFbFPTdxsl39CL1A==
X-Gm-Message-State: AOJu0Yw2dtjIsUEwGN8h1sCj61eoyJ7UB9vf+d51oakM/3rrD8glot0u
	ooUMQYd9JEamWsovBtl4/+7DEOD3zz9b3jzHcRPoxInvJ3xbhIcH16rK9zR0ijdkkyHFiuE4dw9
	57qtSFOnTjjQwhbwWp2zHTQqMXAU=
X-Google-Smtp-Source: AGHT+IEtCexjiuXZK75cPHFou7MFEdrSMz1QHM/g+Pw6sBaSoHOeNy8WhpXZVJeQE+eP8+Y9+70hgwnoBRHhm08ZuBQ=
X-Received: by 2002:ac8:5a8f:0:b0:447:dc9a:1cea with SMTP id
 d75a77b69052e-45004d7b3d0mr118358631cf.13.1722285461924; Mon, 29 Jul 2024
 13:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com> <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
 <ZqJHEdxwEpr5W605@duo.ucw.cz> <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
In-Reply-To: <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Mon, 29 Jul 2024 17:37:05 -0300
Message-ID: <CAM_RzfaoPT0ec_AAUd-fZgQeHisRW9OQU+pRnt0rinDRB8Xh7A@mail.gmail.com>
Subject: Re: [RESEND LEDs] leds: remove led_brightness
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guilherme Gi=C3=A1como Sim=C3=B5es <trintaeoitogc@gmail.com> writes:
>
> Pavel Machek <pavel@ucw.cz> writes:
> >
> > Hi!
> > ,,,,
> > Yep. Such drivers should be modified to set max_brightness to real
> > number of steps hardware can do... then we can remove LED_HALF,
> > LED_FULL and such defines.
> >
> > Best regards,
> >                                                                 Pavel
>
> but this will require the effort of everyone who has already written driv=
ers
> for some LED hardware. Because only the driver author himself will know
> all the steps for that specific LED.
>
> or, maybe we can adapt this drivers for understand the brightness as a 0 =
or 1.
> 0 for OFF and 1 for HALF and FULL. This is possble ?

If the manufacturers of drivers use the LED_FULL , LED_HALF , like in the
drivers/leds/leds-pca955x.c  on line 254 , how can I remove this ?

In some files, the driver uses the LED_FULL for make arithmetics

