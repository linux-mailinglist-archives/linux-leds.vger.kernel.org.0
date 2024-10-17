Return-Path: <linux-leds+bounces-3126-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FF9A2DB8
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 21:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAAA71F2339F
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 19:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B9721D657;
	Thu, 17 Oct 2024 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFzKBkO0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DB21D2A3;
	Thu, 17 Oct 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193044; cv=none; b=O8mRa9ChrMrXT4k2AkTe3z/2gLtxSnculY+xm0DHpresXJ+vGKmysil2x6eyD4L4/K6LusYsPlNdD1Q6Yxa9OVTAHVUvk6UGos6aTdH0TQf3dDMH0Mp0ljEsTE0pnpINwPt8FauVGtjTI/bXB88Qvf+Yuq21g+hg17jEzIN8hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193044; c=relaxed/simple;
	bh=rrYpyxR+gjDQU3TJ/cfAclUB4zxBbYHHlIOTA+Ubjhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGFlgfVGG0o2FD912IPoFKjoLuX25IKs5EVj/th9uUg7ee+MKzjYbQGUow+z4oB+vTNmjUbxdJa1uaJJlDL/zeS0wYjwo/M2fcU4kxO8UH0X4qhTvApPRP/Od6zzPNMek+x4UoQnAPBRg58Sn2+wdKmc6Xb/RwVFf8OOAosnQaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFzKBkO0; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50d487a93a5so395417e0c.3;
        Thu, 17 Oct 2024 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729193042; x=1729797842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+TOobXn+Ya5c6r0qPo85Xz8jBuI+iMeVackKv7DDL8=;
        b=mFzKBkO0w466Ow5Gx3PR3VRfsMuaPcJsCP2YLOveoLHs1xhBch3lownM0LF9Iickh1
         QEp0ivQcAsAbe0y0kT6eZtkQPkQJg6RMa85ZGINZ7cuBoCN5I0hpWL4Yt4nBjD7ri3Uv
         DDO6btw0DCj7n+ybdLPtTQIWZ9EodeA/CINXgi7846oTqxiY3cM3irMxs6+OPY3TeJ93
         lDEUZj2gNjtQuNYVY/6h0WIgy8WbUGDIrGpPGyHgoPfxvfpg0hLR4nhY0oPQO3z94HJK
         YvPbtKXh6vAms9xineP0Q1jACMGarXK6xq4anp1hjefh9mRF85yR5gZuMp/G3csKaGHO
         1Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193042; x=1729797842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+TOobXn+Ya5c6r0qPo85Xz8jBuI+iMeVackKv7DDL8=;
        b=Tb1yDPZ1Ikm5UYdPkZDZOrUitBMItwIUYK4hIeeadajelkS3AItPbxzlAFWbf6UcaI
         TXKCjf4mDfFnI/t2lrJXWtKk3e0t7RkLo3b8A0/m94s6GcDaHRgXnEJZd2e/XAYPeooA
         hp/GrOiJ94s+TtdFnmFbO709GBKhr01us1MwrWwVSWQjheTNvTXThEd43zBthUzxMTqe
         ZO+uPQ3xhM9YxBEiDj0vaDgwpblBLFYzIYhdGbImNO4RND5hBajspJuCo8QQKITZBDyH
         C426EyxR+645ZRLXZUfTF2E98mB2d5qDWP+u/paYpj2mMVYggspJbqdnQfuh4TqgiJol
         GDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmDuP72dCyit6e4dSTILuRJFsHeTc10vMr9vrWXCEcpLaQ/6P4goTDOIwVBMcCLRGP42aGMjpn0/P1cw==@vger.kernel.org, AJvYcCWTv7Jlh/f0DZ+kM9k1l6q1PKW7rbBxR9cPK4zav6qoLWnrr2vPm5z2Z6SUcIJHx6CILbUlNUGAcavRj6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRXzWMf4XPl3oL/q3de3hfDR2Rdug3SHtrOn9qXX5zaYQKceK
	OIhNlKobclAHFOiQ81o2yzOAoWzRQ2kY0OeWfe5c7rQK/0Wrh8sYNwL4woTh22WtZVMA01EjatQ
	qLAno+Bh7uGeYUo7qQDs/q4c2Pu4=
X-Google-Smtp-Source: AGHT+IE9STtg/HBLbT5CsVtg0opYZo4vhNcEzemldweQ5BsDAjbsCuo2zAnooZF0R3lzDfAiQL9ylIGDPLp8hhibJRU=
X-Received: by 2002:a05:6122:924:b0:50d:4cb8:5aef with SMTP id
 71dfb90a1353d-50d8d259605mr6962981e0c.6.1729193042156; Thu, 17 Oct 2024
 12:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240922174020.49856-1-kdipendra88@gmail.com> <20241009133643.GI276481@google.com>
 <ZwkLCE9x5DWtaaJU@duo.ucw.cz> <20241015090102.GD8348@google.com>
In-Reply-To: <20241015090102.GD8348@google.com>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Fri, 18 Oct 2024 01:08:51 +0545
Message-ID: <CAEKBCKPJDz3=qFWSy3SQRHNC1fK8vAcqJzpJMyyHfCfUc5yTQg@mail.gmail.com>
Subject: Re: [PATCH] Staging: leds: replace divide condition 'shift / 16' with
 'shift >= 16'
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, avel@ucw.cz, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 15 Oct 2024 at 14:46, Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 11 Oct 2024, Pavel Machek wrote:
>
> > Hi!
> >
> > > Staging!  Why Staging?
> > >
> > > On Sun, 22 Sep 2024, Dipendra Khadka wrote:
> > >
> > > > Smatch reported following:
> > > > '''
> > > > drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace di=
vide condition 'shift / 16' with 'shift >=3D 16'
> > > > drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide =
condition 'shift / 16' with 'shift >=3D 16'
> > > > '''
> > > > Replacing 'shift / 16' with 'shift >=3D 16'.
> > >
> > > More info please.
> > >
> > > - What is the current problem you're attempting to solve?
> > > - How does this patch help with that?
> > > - What are the consequences for not applying this fix?
> >
> > Take a look at patch. Doing shift / 16 when testing on >=3D 16 is just
> > ugly. It is simple cleanup.
>
> You missed the point of the comments.
>
> Copying / pasting the warning into the subject-line and commit message
> without any additional wordage is sub-optimal.  Please improve the
> commit message.
>

Sure, I will send a v2 for this.

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

Best regards,
Dipendra Khadka

