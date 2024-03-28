Return-Path: <linux-leds+bounces-1374-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3688FAEF
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 10:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CBB1C2A04D
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 09:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9B5A115;
	Thu, 28 Mar 2024 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cY6JOo6N"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295EA44C61
	for <linux-leds@vger.kernel.org>; Thu, 28 Mar 2024 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617426; cv=none; b=RxgV7OkgqxPYqbIAEhqT8oW+SeC/0Xwl6MPFpPA9+mcmTvK0wCdze+i3l+4jevqKwhmBE2RCMJjTQ4Ysm93HvYVKCdMCfeHD/nOGXk2wKT6Ew7Gy7BrNz5Cm9xeFtweYzeNvQedblBA/UOn6Wcjif4fOEun+t0s8y+UQgZ1cafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617426; c=relaxed/simple;
	bh=6Gy4ugoy8i2cxQlvWL7ALq6UFeZ+OdAO4iKWFswgcnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeApQGT6Hxu/WCDgFJtePH6QpwjdqH4AiJ/zNKE9ikWacNxbBSMGUYo8sm0jehYqf3Ef5pYg5NYXtacc2w5vXXI6NdtmG21i2W+JG7+ALIlVLd80h/UyisXouQTKcK2OxcsDbguqq7ICDr6z6EFQ5VuuGgczbmuy08+S5INU/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cY6JOo6N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711617424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHdntgzQNe3U9Pl83BPn/RLVFTNLwSPTo5R9/5t/aKc=;
	b=cY6JOo6NF4hbbVQk0RWom1z9Su5sluBHObiyG68PmAYDKa3wXf5tB7xhoSUrmmCddmyZfG
	wbh0pi43JrJkDg6dCXDXx+S23L0wiX+IvNfnCbKy4DmClfs19yIKP1bwKJTv3M6o5v3d9t
	ptYzrfFgnh1D19r8B2//+y6/CRCHjiI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-upwEQOpANBq-d2X1ha4dGg-1; Thu, 28 Mar 2024 05:17:02 -0400
X-MC-Unique: upwEQOpANBq-d2X1ha4dGg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a0862ca1b3so614610a91.3
        for <linux-leds@vger.kernel.org>; Thu, 28 Mar 2024 02:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617421; x=1712222221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHdntgzQNe3U9Pl83BPn/RLVFTNLwSPTo5R9/5t/aKc=;
        b=aynvrwRLahgWUBOJ9DzyzfFwWtJ05MZ0DU3InyAN2m8j/3jHMlH2IGbRvUMgcKtBW5
         9iAEbIt4BkWj8or828dI2eq5+i6sGEt+lxSmdX8mO+gAxXolIAlltvkOuYHdXMraOApf
         zpRS7NEnl+l4hCrjrRYb5czu9ZDWVwLLjJIuvGX5UG8+aZDjexN21cZ8VmtzaMahgOJq
         k+fqopPi8qs6mcQQ5r2nxyrcf1gadY/ishKNjYrxXI7kQ3RW2LbEchCaamwWF3et+gtq
         O9lPN05HEi7Wa848bU3M9A6iSpwodBhRNfxWEFKYZaMVmYQrtEhKnhm2f9pHQyNrynDa
         OmQw==
X-Forwarded-Encrypted: i=1; AJvYcCWkgKRUEVMAxdf67kW0zgclqZ5M59/c2T4AdgXj4lXQfv5yPIgG65BiZH7MSjIRiBmE/mKcKJjmmkxgskMUpqAjO2r4xEJGAgIwcQ==
X-Gm-Message-State: AOJu0Yx/8iacLSVG9lBcrOnBXuSGpS8OSeNxHP5S1TQJ7Lly4qAPpMMo
	MrHn3/xt4PKGSHzXNau38LYVL2CodjK69kGUdtt0u5LSMTlPBtV11RkepEr8dBnl/U8HrFADR5K
	4a64XFb9qsMKK4xPOCFtP3R+97twsAirbF7ZxPbL/1xeQTjNqk8YURTSkiNXYKH7ThsK9lpJlGa
	aLdN16p7eD6gYlrioaPKdf3vMSmM/HMfCTFA==
X-Received: by 2002:a17:90a:3045:b0:29f:a779:1075 with SMTP id q5-20020a17090a304500b0029fa7791075mr1930916pjl.37.1711617420963;
        Thu, 28 Mar 2024 02:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh7LIZK1grxIAjSEbZxJU8sfdCnSCR08Lls19g/j9dBiAagox0TRBn0uSzYPXhg4LEkFCO+54lcOqzrGPqdQw=
X-Received: by 2002:a17:90a:3045:b0:29f:a779:1075 with SMTP id
 q5-20020a17090a304500b0029fa7791075mr1930908pjl.37.1711617420686; Thu, 28 Mar
 2024 02:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-3-hpa@redhat.com>
 <CAHp75VdosbYNKU90QWt+6SU_i5dWC94=xZy0GXiKvoQeDF30wg@mail.gmail.com>
 <CAEth8oFuPTRq0z-YbMMFt=kKgre6x+bDhtpUkj2vJeK-u8O72A@mail.gmail.com> <CAHp75Vc6=0-eMMXYQEn9w5N09rKR9NNrqFPR8LBvZZyOiscsig@mail.gmail.com>
In-Reply-To: <CAHp75Vc6=0-eMMXYQEn9w5N09rKR9NNrqFPR8LBvZZyOiscsig@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 28 Mar 2024 17:16:49 +0800
Message-ID: <CAEth8oF_YD1dosS4a9N8UgTiQyUXuJF+HJR5xNv3+vz4KUzw-w@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 2/6] leds: rgb: leds-ktd202x: Get device
 properties through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 7:08=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Mar 27, 2024 at 8:53=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> > On Mon, Mar 25, 2024 at 3:57=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> w=
rote:
>
> ...
>
> > > > +       .id_table =3D ktd202x_id,
> > >
> > > Seems to me that you may split the I=C2=B2C ID table addition into a =
separate change.
> >
> > Could you please describe this more clearly? Thank you
>
> I don't see how the introduction of the I=C2=B2C ID table is related to
> this patch. If needed it can be done separately, no?

Okay. I'll prepare a separate patch to describe the i2c ID table.

Thank you :)

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


