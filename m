Return-Path: <linux-leds+bounces-5276-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62937B302FB
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 21:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3001AE00F4
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 19:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8233E34AB0B;
	Thu, 21 Aug 2025 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOyDR+9C"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8562EAB62;
	Thu, 21 Aug 2025 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804862; cv=none; b=WmcMRgv/VxzlIPdyp81qIfTPzjRV/6xCr1w6lOZySFVSZwDCRD3Df46r+mhNQpD+y5sq3ljFv1fCAPBHuSdHB7B3L7a55kTDUPTmTQz3S9wiRNEyowKSntnlCvEyN5z8NkTjl/exTCAcUIIxFLVedsAO6aJMe5kzfdt8wKA3u3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804862; c=relaxed/simple;
	bh=wQsIts37TMJK8ZM8kPlc02R32K3djynS9UuKonfmBlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R43lHjIWpM72+PwGmYIgx+ES0lZwtI/BzLHGf8HmfDhuny1w4xkmm/T1wlu83xHiKsNDUEPzkncPAq0NzBbwkfOKi9d2Ajx9mhzTtMlEh9fJ3LQXi12WoAlxqryDdSqHu4XmyrDwNvdy8bYYL9AIWlKI8zIA/+BexD3GYq+Bwag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOyDR+9C; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so202661166b.3;
        Thu, 21 Aug 2025 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755804859; x=1756409659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSi2Ib5B8y4h/BZf12LD6UAK6PFOl5IZxxe+a5EocyE=;
        b=KOyDR+9CXiZgla8PmpaJ0kyePTbrX/61Igg8lo5R3N3iquelnr38ZYrxxU0LEsdlwA
         l6r6VgLKdCoyMEXEPzXJ6fPm89FCPIVtDC+z+kvNZ35LsDAOtZ1B4uqBLvoJLRhVbuFE
         kQMWsMT7+4kU87cHO95cxPvXN9ctuOt1oaq4opDGKY/BIUC3xTtQo0hMHT1c8I7iunQD
         gjNOAcmfTzIg6SYqzSApVoZQdRq/NqiIrAMc43+6tTIs7h5aIUtgdR4StbSSJEr/KpuL
         5IWVgs0SATJVjGXhBvjKeYSBA/fXSV+fo0b8UFasJVR4P4ltXfSUtrcRaXowuzrMLZVE
         tmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804859; x=1756409659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSi2Ib5B8y4h/BZf12LD6UAK6PFOl5IZxxe+a5EocyE=;
        b=YFOesoBFsial7PUztmrtHFJR1x1jwuMERtUKojR8Oa4thuePHLqUHUk0YwI3uCC2fL
         BpBYmHm4RuBstN1jnNvP8sASxAg5Eafohwc3Ev2xqV30hikfu78ymmko8outftWNNzND
         MysrXOoixURlsC7jsGZlgKh0xpIpR79g1QGvqmc703u4+4nOhhBs8/wJIPJWs5+lMA93
         MSa1AzhX7KNcrklpnNKmU7dSbw3I0kv40mCSeV6n8gYNdqIvMCQRJNce5/sJzzyTVTa3
         2zvXCFTu2dV6oaGEb4dXdT9J/hQqIdb3HrvtPBuSYtDpFu0Up0N3woIjj0AzDslSL2Dk
         Y9yg==
X-Forwarded-Encrypted: i=1; AJvYcCUmiQaZOxV/DtDHzZ0I7Rx0QnaaQyTJD+k6Zvd5QgFzjxxRRka7uS0TK9Dw0Vtd6WF86nbEkcitJF6w3kQN@vger.kernel.org, AJvYcCUrZFCz5k8ZTkvub4HiIgyU7huc3zwfx6psDWwBsw4mm7PIBLCjfl+866kKeoZywO/VN/Q8tbPRuAfz@vger.kernel.org, AJvYcCXmZut/4ootb+Wv05zHKGxziFs7RHqOFDcL6fV0lOh1Llcb0vpXnquv1WufxSbB72gPY4k09uKix7gagA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxXT4NfDhnHGGWhVuIOuBVLMJ1v+lnP2gc+/clDMNDQUmJQR1
	QWI+QhcBcMT43fcEolxZqeFlKABBjIzxWe9izloCISydEbbWIelVCMTk2GhYNxhrGpr7ytY0IeS
	bne/qiKlXdpc6wwcLNJ9d7DPNyyomlEs=
X-Gm-Gg: ASbGncsGVsjLljzutokahPj8gLJiGrEMxekA6gfxUVhNoepqH3vMrX+wy8oAe0fB+F7
	jhrFXPuHNUjFz4gX3qUBYcPwtaOY4hLdngpPWyIl8Glpgzp7VLMNadZNQoMfr1fEWYlwwz7adYr
	JSQ0GousAok3h2MehQyLtPZkFL/8CqW3mrX18w48FH/CnNYVxU/ZZn7CLxFpPEj96qr6McBWiim
	/7FExbwncWV61zmcA==
X-Google-Smtp-Source: AGHT+IEaqG8N4XT9inMoXWEpl30uYxyEbrA+QwKQ4KvOcMGs777P25dSfIILt8L01rzClkwbyuOzwbN1F3ee9RfE5DY=
X-Received: by 2002:a17:907:3f1b:b0:af9:116c:61c4 with SMTP id
 a640c23a62f3a-afe294467f3mr28663466b.48.1755804858797; Thu, 21 Aug 2025
 12:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com> <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
 <20250820-clock-easiness-850342f716f3@spud> <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>
 <20250821-diminish-landlord-653a876e3cec@spud>
In-Reply-To: <20250821-diminish-landlord-653a876e3cec@spud>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 22:33:42 +0300
X-Gm-Features: Ac12FXyyviHjG0-8Gw7lg6URgx5oV1B1vHVhH5yNS3Aq-sMhy8QFJm6eTsq6qNM
Message-ID: <CAHp75VcDDCjt4vTpnSCprfAzK+czJiB_PRDXuLkvtuHZg4SLEw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:40=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Wed, Aug 20, 2025 at 11:29:47PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > > On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> > > > <jefflessard3@gmail.com> wrote:
> > > >
> > > > Besides the missing commit message, the main part of this patch sho=
uld
> > > > be merged with the patch 2 where the YAML file is being added.
> > > > Otherwise it will be a dangling file. I dunno if DT tooling has its
> > > > own concept of a maintainer database, though.
> > >
> > > get_maintainer.pl will pull the maintainer out of the file, so it won=
't be
> > > truly dangling without a way to associate Jean-Fran=C3=A7ois with thi=
s file, if
> > > that;s what you mean.
> >
> > Let's assume patch 2 is applied and patch 4 is not, what will be the
> > result of get_maintainer.pl for the YAML file?
>
> Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVERS)
> Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY DRI=
VERS)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEV=
ICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FL=
ATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENE=
D DEVICE TREE BINDINGS)
> "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (commit_signer:1/1=
=3D100%,authored:1/1=3D100%,added_lines:471/471=3D100%,in file)
>                                                                          =
                                           ^^^^^^^

Which is a git lookup heuristics. If you disable that, there is no
maintainer for the file. Try with --m and --no-git (IIRC the option
name).

> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
> AUXILIARY DISPLAY DRIVERS status: Odd Fixes


--=20
With Best Regards,
Andy Shevchenko

