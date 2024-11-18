Return-Path: <linux-leds+bounces-3418-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E09D158C
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 17:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02261B261B7
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 16:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0321B5EA4;
	Mon, 18 Nov 2024 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlUs0A4Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F852225D6;
	Mon, 18 Nov 2024 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947959; cv=none; b=hBxXUU5jpuoIlA9DyfGDfJiH0mwFxrKli/JZO8PgEJqx4MxyjJvfRvrsJfUwqki9gaQOi/RY8mPiP+ftv7/7uYs9kZpLDZX2TZj3ONUJ5zTFmqGgJ0XmX3X0uj/sC/0doG2mfFqGCY56gPSBR2uEYU9clACcjk2+Pg5IGMNYKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947959; c=relaxed/simple;
	bh=nmA4ppkMTICL/gt5CLE+iRaWAkj1SjTpLtPXZChoHAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBSwSVg/3sZCg6SrqqtrU+fOTEffPlaCNF5Oq3tyrZTL3asm5fkSCXgUra3xGOi3v3bOOU70fAw6zweitbTIsj1zDRWgWUkXe3sbq5qbuzBVtbPxXjAl3gtWfuB8y+nKaJoFn5xPf3jldRA+tJ5WUDzkOxbyEgH3nE3IXtHKNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlUs0A4Y; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ea93311724so90568a91.2;
        Mon, 18 Nov 2024 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731947958; x=1732552758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmA4ppkMTICL/gt5CLE+iRaWAkj1SjTpLtPXZChoHAs=;
        b=dlUs0A4YD8J6+HWn5TIwqvGPk9oRN0mJv4l4k163lWc1khktL7Jak4sd3BWsy96VJ0
         R6fxfDIL6Gm2jW0lKuiIwsYJnwDCI/NBlnE/MWh+koC/V+RcnCzFJ2xrYMeteipENBIq
         8I4rJs87+tRIIflY1lO6xikYrnmnKCEDYO8Sxn+srjb22RrFkadigpiI3dQQ8brNL/Qc
         1WhJuEwdctgZWKL9Y2rHmKAvtljvtu+8F8ymB43YF3g27XYzHN7EG0snFzG+HewM1KlZ
         7BC/zbmjyoDyT8HTIjzxHPeX7y/J2t3ppTCHgFFuQ01SgWLbGjnw2hZl4xfBMH9a5UQ8
         Pt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947958; x=1732552758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmA4ppkMTICL/gt5CLE+iRaWAkj1SjTpLtPXZChoHAs=;
        b=GPftFPEd51CGNLw/PKrPc8GIp5S/AxEllBQZKVcrdY4maxKaZK+41hMYpQdzgRVweO
         SWw2HdMltKOlItLqx7VsUZAaCTiaz1stjxPvlh90HHSsjaG+uu5vs7DCo5zKoKv+ImG8
         Ilf4MSnsNAjYF1b8QIPJd+pehYF7sFlVDaBom7mBMNfxUmE/gGkqldIx+hY7EoNc2ORQ
         IjgYZsSmnTp0oTkupW9/e9eLf7AaCZNdIKg3bpnesm+UxbM1PMLRk7zdEpNUqbT8gTkX
         evFhachpkx+OorVkPFpIwXgcUQ2VIrjVAAOoM2ztUEaCCgZwRBy7VUgFUPQl/QDRRrqs
         +7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVXkUwk6z+qkBEiHpU7NsmZiV9G4kemOqH32q/gQ48+hynMqLbl4BqxWzBGRo0+pGoZKE6d4ZVd9sqi8tI=@vger.kernel.org, AJvYcCWiGFcjqZTMeZu1/+X5yxgxZVGEtSefmnCJVv5SCWHbPTJw9FVWSycIwsTie/dIzkpHiaKdp05SfmFPTw==@vger.kernel.org, AJvYcCXeDvin8+N40iBbGyy65ZZHznMRZ5CMjv0GsGWWKAgjLYF2COi+MtWQcE7Mz0IJChOjAJbuCmGyO6yFLOjq7xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRK9HBIcOHmjbkflcs8dUR+/25o4fAHUbQIN5nifTMIES7NLzs
	ZA2wB1FuCcDwFjHpUKddV+KGWROXqNHM53afuZgXEnMwUU+bImOPHTcpS+MeG4F3EWe9lwe0Cnc
	wOPt05p3NHvtgMKQRtJk5lkxeQag=
X-Google-Smtp-Source: AGHT+IFkb2PVZdivVpOSE5c3xRxBapgeWcHncWaujmbKW/klTqGeznXMgcaMscPyBeudFOdb+1LnOwjAF07TkoKuNS8=
X-Received: by 2002:a17:90b:1d8f:b0:2ea:6f96:64fa with SMTP id
 98e67ed59e1d1-2ea6f967fafmr2412946a91.7.1731947957983; Mon, 18 Nov 2024
 08:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009105759.579579-1-me@kloenk.dev> <20241009105759.579579-2-me@kloenk.dev>
 <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop> <CAH5fLghthWr4r0v=2xNE_UJntG6o6qRzdqHj_nu8AKUwUWh2Aw@mail.gmail.com>
In-Reply-To: <CAH5fLghthWr4r0v=2xNE_UJntG6o6qRzdqHj_nu8AKUwUWh2Aw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Nov 2024 17:39:04 +0100
Message-ID: <CANiq72=sGDU2JbyL6sKTJzmuLF8J-hud0WXLctkycwOV0h8VFg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Fiona Behrens <me@kloenk.dev>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 11:19=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> signature. When you write `impl<T>`, then this means that it is a
> template (we use the word "generic" in Rust rather than "template"),

Marek: a main difference is that generics in Rust require you to spell
out everything your type needs in order to be able to use it in the
implementation, unlike C++ templates which will gladly accept any type
as long as the resulting code compiles (i.e. whether the types make
sense or not).

So in C++ you may typically do just `T`, while in Rust you typically
restrict your types with bounds and `where`s clauses like Alice shows.

I hope that clarifies a bit!

Cheers,
Miguel

