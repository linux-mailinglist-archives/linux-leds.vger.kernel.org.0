Return-Path: <linux-leds+bounces-7393-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mARaMZ7tu2liqQIAu9opvQ
	(envelope-from <linux-leds+bounces-7393-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:35:42 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 226672CB34D
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE1AC3058DC9
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 12:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080CF37E315;
	Thu, 19 Mar 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHFP6AJ/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7E34402B
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773923628; cv=pass; b=X9DASW9FZ6epo6nkqaWnwMxKkZ8cJCDrPY6eU8SK2tJQaZRWxd7HWm/2efRjFlvQtmKOTMUQj1q9kdazakPsUTpB+tbiFyMxQdKJleVDPS6AoJ7nxOZfpCXF8Uva2fBfXt21fuTOCmWg4XsPJSzxsuHO7jB+XE1BF+oziHp+oH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773923628; c=relaxed/simple;
	bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8j9sZ2hMF7wV589055iQ83Bss81eRXG4TNWy/zpBJ2K4ADtMg8mVII526ZmI0PDIGbWzznN7Fzw8f/VVLt6aDyg1Qz6L8F14cugTrlSEhXEEscKDd7PmWJfo5eFGIveUVsMi1tzcrVYmLGzbA27JFHeKjSMu2U00y0L1SxvpBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHFP6AJ/; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aedd812baso1022368d50.3
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 05:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773923627; cv=none;
        d=google.com; s=arc-20240605;
        b=GAHonSRoUdRGWbG2/WegFvfkyxSq0oelhlibHDuFRhxPBu32x4IKdKtnk1+84VGsNU
         vK5kPNmfu9K6G5tl3VvISPVZIOSzc5fNAlLYAT75x81oagShvrce8G5zv/fxBd5FbTpK
         yDKrZbJvjDZrYZM0vxWseSZF1osKKJgwI5kaaCCnBeKtutGRn6lvlj1+xV3qp8USi+Yh
         IzccyAJ9aNbYgaQ+qshq71F/ExJq/ZX3Z4Sdfcn0zm3ll6kc6bD2ijQ3c/S02rBYJWLp
         n6Kv2UBmgWV/ALZTx6RtlBFMrOt8iAGVmwnuEALam8hUQBF+PJSo1uK9ZzpHtAxHer9F
         815g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        fh=IfCZXyHK3DQGt+Ugt/LDWJyQBHiaJDqSLEHoclFMOxU=;
        b=MS475FT0jFDzdP+R32arKNz1rnMwBg16ec3qumJw5SHrD9fTVZZsZsR5vilcSoLglH
         dCn2//SzhI821MX9difMbCjzDxqbQZl3sNeJlaLcNZ1RD7XwtbBvMjmOwd5K0KPXZLE0
         RwpsgZU7f9+ubsr0VTR0Clg0uKil6zP5q1WaZ5bS7flT+EbTo4j6vOZQPdzHHEQJ8BPV
         KrUlHjVD6WATDImwY+zlRK/yipIAz1jDGQcJ/1W7Vx8/Z6Jgf/601FRz2FeapDyeRFy2
         9laGmJ5KJn+i/0k6tKVBZLtT7w2DHNuDpa9DnUxPRVINlE+C99WNu4JUW2klzvZ0QUCJ
         LmDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773923627; x=1774528427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        b=UHFP6AJ/TugGhJ8q8s+tVOZOWnFL6rSNekg5HK2GRX/lGLdzVMjT5xHh/ySm7x1pES
         j2qRgqWDWrn7HTXxcH+L+BzY8ZqcGNygMi7SL3Rw6LLcfPR4xDDxkaGZoSuO+9rLf5dj
         ogoy1vqlp4Z8sh6ZoT7Mmw0Ng8kvfeNCoFF1kDOTwSbUs3ZedRHJW0/WbWoDJyjim55Y
         P/jf805+d9JGinzjlK7JqnrFXnPkGSdqVSol7juoFhxaRC2DGUn36mG7bI5H4R/Mwe4R
         UVWuhpOSXZxt1rchnGlYfu5HPiOEcMxHr/8n8G3AIFVnQD0lQvG7ZzQlRzDLW+ZTI1Rv
         3QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923627; x=1774528427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        b=eK8LKgOtz/JGAozVZbxZ6bvmxAnmFxxDGs2sQujGl5p1CYMs0b029O3fT36NIEuQMn
         MrFW8QmwN56KCWiPAv9AwZPCJ9UbrjuGPs/ZCmflRJeIbasCnWo93BGbHJNqS2qJukqw
         9bQOnCDB9/nu+uaQeW/2IOODDWXqPtBD4wyIuZWUQTfPrNZS5/7Zq16EPjpfdr5QMikL
         M7pB+ZdGDlB+JK4ch7Wsts/oVDvZ0T5V7iSN2yfSuf8TWjQxTaHplMG0tGXkXm3J+KQ6
         v8CqC23TmGQ2Cpwni7vIXur/6gexutyINo+k0ALXqO7vAd1Dn9lFMIMPsgUrUHszCJAV
         +ypA==
X-Forwarded-Encrypted: i=1; AJvYcCVlL7O1cqxXe69yk2hamxxtZlAKwbD5WsfQGDVd0y+6dnKCMOEmBEoOAdcNfDIcuQWtmU1Ap9yVto8z@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOvM20V7a9zI1OxUWJPyhGXlDmtDbloNyhTvuax+OqA6knKHF
	/fkQPtFa69TMgCaFwL9EexEy/j8HC2TZnoTz5tuqGihY8fbz6MZda50g/R+dTfNYST1tm1HSG9v
	Wy5cAyVhAy/iY8bgP7fh8hgbHOtfQksk=
X-Gm-Gg: ATEYQzzbyot5jGiknmAqp9qU7buNpUt36NroUXReAqvjj69hTSHW4sXLSISFE6gPOKP
	0G3VteaMHoRy/oY8so+kOkFbTqhKnsxj/SE5EQlq+3eslI487PS4RxYNqVAPxe31dsbkenSnngA
	dkYdmdiY4IZa5MBGo5rIRPnf1RbsOI2SH01p9kVgDLgbqP0UWKAdSkhJbKUQA+hODG4ALdQTOwj
	su0cEMLZFGg2WCAw0Dvwv9ME3hpcbDFcnD+ja6Jc0v6r7bxljOs7fPkp9vOOgPkujrJ0fo0mrF+
	iX7r
X-Received: by 2002:a05:690e:4148:b0:64e:a87b:4084 with SMTP id
 956f58d0204a3-64ea87b42f1mr54461d50.9.1773923626684; Thu, 19 Mar 2026
 05:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
 <997e3ff4-c394-4fbe-9371-272220ab2aa0@app.fastmail.com> <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
In-Reply-To: <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Thu, 19 Mar 2026 06:33:20 -0600
X-Gm-Features: AaiRm522GxGxlZUpHWOnYBINehFbMNmusJuJGcG6rdPfxf0Kqc-2n3ihHKvdAZI
Message-ID: <CAJfuBxztAe3vzzviGH3QJnhU7F68ecrafTLUoaR4BMskMp__3Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: scx200: move the header under linux/gpio/
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Boot <bootc@bootc.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7393-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.881];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,arndb.de:email]
X-Rspamd-Queue-Id: 226672CB34D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 3:13=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, Mar 18, 2026 at 3:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Wed, Mar 18, 2026, at 14:48, Bartosz Golaszewski wrote:
> > > Headers exposing symbols specific to individual GPIO drivers should a=
ll
> > > live under linux/gpio/ for consistency. scx200_gpio.h is currently a
> > > top-level header directly under linux/. Move it and update all users.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > > ---
> > > With Acks from relevant maintainers, I can take it through the GPIO
> > > tree.
> >
> > No objections to the change, but I'd point out that while this is a
> > driver for gpio registers, it's not a gpiolib driver but rather a
> > custom chardev with ioctl interface.
> >
>
> Yeah I wasn't sure if we consider linux/gpio/ as a GPIOLIB directory
> or just GPIO in general. I figured it may as well be the latter.
>
> Bart
>
> > Since the chip was never as popular as the separate geode/cs553x
> > ones, I wonder if there are any users left, maybe Jim has an idea.
> >

I have no idea either way.
I still have the HW, but its been unplugged for years
dusting it off has been on the list, but way down.

> > If there are users, they might be able to use drivers/gpio/gpio-cs5535.=
c
> > instead, but I have not checked if the two are compatible.
> >

