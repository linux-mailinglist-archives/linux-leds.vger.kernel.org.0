Return-Path: <linux-leds+bounces-5267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64BB2E6A0
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 22:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653E2188E25D
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 20:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9714F284670;
	Wed, 20 Aug 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+w3uvBn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E4FDDC5;
	Wed, 20 Aug 2025 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721827; cv=none; b=bGCenSeJpnUa3lGLjiDhKaL9aavi0rQ1Hyg2gx9efs/UQrX2pmj0fY1ntyZNvsA/bdfIY6eh+xdTpqQ7tQjk/ahKt2Jaw+smFrSJV4WnNlU6QrIQU6OZA85xZWOR8vbFjcZzxJEGxrK6Vx4LEBc/7e0OpTuYYINBzVTPBGVW77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721827; c=relaxed/simple;
	bh=doqwHfPGUMR8lu70Or4P7gSVpsVVdOWcGxZ5aSBWeB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufuUH+RA2hRgC3+7qW3re6TZRK2Fgx+h/pnIfvWbeCLSbKktVzn8WyG3OTflQVgqbCKEYkomg2bmIpalGWgoYh66kvQo015RLrf6PTfiZT0CjzPUGMnQx+TQJlJUdNhByT/tCStsnesxsaeK2a1Zs77afpwLofmxTtE1sO9B0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+w3uvBn; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78d5e74so44975066b.1;
        Wed, 20 Aug 2025 13:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721824; x=1756326624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doqwHfPGUMR8lu70Or4P7gSVpsVVdOWcGxZ5aSBWeB4=;
        b=Y+w3uvBnOag5+dBu9292T9soNo68XKNhZY6njdQ2+3M6Zj8TaL55udJQ/dS1xuHuyp
         LMK7qpzHdTBSELb1vZKb/8Owqnwr+2Pjq6gMKer0/E/p94eEfS90X//1kIdjsG37LD0s
         RAFnCfergzygRU6UrobxtTgIrq5UrtoQkwsYtMgWYzgvjOkLRVsAtI1zT6AcT+OHxSNo
         YJeP2AFNz8xgEul4QolvgzLzURxwC4TwtN3lMXpaat6g9lGGbpC58Ms16TiXKvTCLzmT
         +nau/lZJBGaJjAG2PiolWVu33siUgrXWu4sGyUUVSKOljhcE9wDEYziTpc/qVfLHOCQ5
         PbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721824; x=1756326624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doqwHfPGUMR8lu70Or4P7gSVpsVVdOWcGxZ5aSBWeB4=;
        b=lkTv54z1ED4tzWjH8XF9/zve9LbyDxSaEffRWxjCDlLZf67cx9W3FCiKfF/j17NVbP
         mGO5Qg1SNEs1Tgcd0+fkSblv00JS8KbMQkqiFRIiVTpM6l0KvoZmTSxB3WsD5Aa2+hZa
         zn/4i83J9TXm5cIMAmKOA3FxAKkZhqzDLVzx5RNrnpbJOY98hThtP101mUiT4flaxykF
         Ch4m4Qbv02bmUUQmd3meuMdRb7SXA8/DtFkfa7oZyBVl79bgk5SFvfHo8G+VEkqt8DeH
         3wELFhxF1SMFJ91ZoSTKIyXWmMJfl/kbywSeNl78byeCyY+3GT1XAELaFWLUEWrHj6mV
         wrWA==
X-Forwarded-Encrypted: i=1; AJvYcCUGp1LvgzQ2IWExE+8DnSKH+lFu4i3VuEINiGuZ5V5n7Kc8VFIgAeQlAqW4Y8LdD7NXCtxOr1Gxng+AYA==@vger.kernel.org, AJvYcCUcEToBULq00Iy0OJvJQ8vvF7hIVKbyab6O6t//z/XJypvQD5WLuLJ89FnOFPBdBh4n5sA208FUVH7xcBjl@vger.kernel.org, AJvYcCUwEWaUh39/NyAh+O2Ur1xmkqucPS4SRUtNU9zqhBQlQ/5Rd3bLE9NGK04GNA2ixdf+ZRw1Pmt38812@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlgc417iLRWojdlmA7BJKETKFxi8nDwt6Q9SLWzl//EPjPeISI
	K9prmwe7krF2NBq1N0gNdV/6fg2m0kEpR9HGkqocNIsxSRO/WGsX/6TodcPQJpV6bN7ZW7CAjzV
	DsH1asB+tcoz1FIb9MAMUcmOalPpaFlc=
X-Gm-Gg: ASbGncu+o2A9w5v/5iRtkOU69MBNi9PpkAVpoatryZ1s8XBwQgquKm74FKHlzZoM0Fa
	xxpOXshbS0liFKShP8i5lJTxn3QE3JVHQ1YBpQPaPsnLNFWiAiNSCStBHZWNBeYKk4eff8FI0rj
	a2nmake6bYUUamZl1ECn+ZIfatfhiVOurfDuj/boxMGI6J8MC4lM474l0FFwYffkaaZw943EOkp
	3gl++s=
X-Google-Smtp-Source: AGHT+IFRFd35PFdJxUKj8JgfWBMI4yWgjeC3mgfvoxzaCM/KUeaDklOVxQmePNUfkxas8Ok/F+qpc1XodUPk0mfPbOs=
X-Received: by 2002:a17:907:9484:b0:afc:ebfd:c28b with SMTP id
 a640c23a62f3a-afe074797b7mr16542366b.0.1755721823826; Wed, 20 Aug 2025
 13:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com> <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
 <20250820-clock-easiness-850342f716f3@spud>
In-Reply-To: <20250820-clock-easiness-850342f716f3@spud>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 23:29:47 +0300
X-Gm-Features: Ac12FXydo7b4ik7f_rVVkaQJ3IAEmh-EQ4Wn5505df-XhOJ-Tpe8751t_sO4Qbs
Message-ID: <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>
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

On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> > <jefflessard3@gmail.com> wrote:
> >
> > Besides the missing commit message, the main part of this patch should
> > be merged with the patch 2 where the YAML file is being added.
> > Otherwise it will be a dangling file. I dunno if DT tooling has its
> > own concept of a maintainer database, though.
>
> get_maintainer.pl will pull the maintainer out of the file, so it won't b=
e
> truly dangling without a way to associate Jean-Fran=C3=A7ois with this fi=
le, if
> that;s what you mean.

Let's assume patch 2 is applied and patch 4 is not, what will be the
result of get_maintainer.pl for the YAML file?


--=20
With Best Regards,
Andy Shevchenko

