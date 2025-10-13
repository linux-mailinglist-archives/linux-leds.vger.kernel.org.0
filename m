Return-Path: <linux-leds+bounces-5747-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65498BD243A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 11:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC7A3C4194
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4092FD1C2;
	Mon, 13 Oct 2025 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W6437GWE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62582FB0BB
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347348; cv=none; b=NovgrLtSMjsYjxTx1vKoj97U7t+B8sTUdoqMLJY8SoIv+hXR09g2mKc2k42FP1/XWuZS7zSlAPlDOlBkh9P9p2SzMIHo8WJTfOhjxW1HTxpBxbb15ePjiU9rOH7Cxyptw+k7XKLNQVdpLTF9z9Q/EW8uM5RLn/j3z5QGz4vAcxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347348; c=relaxed/simple;
	bh=YcL+pfwHaciAhA+DIE3esJzDqXvZMrvSN+Utrx9QEv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tW6Kmi0qw7VTxWwll5KkEOEsu77QVpoSyLlz/Y6Wf1rXYHUY89fmuLoeqv6ucYTjkNrZKnmegcI0IKjwKk1yIcaVE3O8prWFAjzKz3WIdzxyIuu3nsKVVT5t3zHO6nzsK9e77a2dQnoA/Fdyfa6dm86hAL9yHpR/GdJCeGua4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W6437GWE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ee10a24246so3583504f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760347345; x=1760952145; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQVd9PQAMr1vRmq9PA7Kb7qWQrANWRTDb6YrEyD4+/0=;
        b=W6437GWEvEw7fPLxJWpDAjGCreJ/JnP3hKC8alR22Tc8Lvm9D3Q+Gd5GoGikdDrUVA
         D/BI09RpRIzAIJ9El+tyOAQ5pONtfWMQBDt260BcYnnf6+wLL8InKBYCP3XAJHgSOmbq
         cxF/dJEM9pZdZ3voNssVPB82jZfrfNoglfKP6C3755Zyn1aVZdyWG9mOdqWTX4CgKIIr
         /UbveKPyj/xI4GevQzsQJnJGQIqxi5M589qIM+qtpRNvsX563mxW3pTa8MVcwFGiwbe0
         NE2BGQXzI04trz1YbK0HWP8cOULOuZFt050UuY8ziGjWlc13goz8IghTR0FF1p4PM2fF
         Edgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347345; x=1760952145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQVd9PQAMr1vRmq9PA7Kb7qWQrANWRTDb6YrEyD4+/0=;
        b=UFTkV/sR3w+DtsFL6KznyRvw6qrKosUU8YSLsgRUoJz4L7Nd1OyLl6uEIx61Yn03eU
         HUL86WNOJXTljx+x1qx1gMYQWFMO9fpgpk+QkQi3q7Fw02EV2FC88ChzstKGgGD8aZoW
         xxwapsgM8O1BcrU7UBAQpHB86x6NyjHgP6pI6TLEW0PetH0Rlfm8rGA38nv1ACErKOtm
         a1FFjnp5pzWoRRL4pyUQLZ3qlLmr24VLUz1CRSRzX+skaF9lGXOcWNsgRCLXAOCChAAM
         x+yiqRjLWsk57L+dZoAmqqrgBSkAxqdom3PzsIDqKSsKAP5wWqFn5fMV6JKgCZFu2ckb
         7ysw==
X-Forwarded-Encrypted: i=1; AJvYcCXEuaAfqzFsrzc5UnkcIuNZXKNVw6OCtnLX5xYfMbWiBgMKyOF13PrP7thPN/w0bQM40AL1j/BEQzWe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XJ66NShJlDQ3HviEF22yv7M+m1+Qj8bzoAhfF3Sfky9f0zPq
	PG28S8EERfQJcvr+d+YTzxtrG5OZZiKupIl1R61CfaeYZdWdu/rvvJxeivLkgYcb2EN5SXD5CjD
	pG8XJVomxP60iLz8KAQ==
X-Google-Smtp-Source: AGHT+IFhyQPEWSetqelza7/DFTbXzpX+DQ4Q5PhuLc71xjCRewxMXg+EPLK2L6PIkVQZIbscZLpNoWZoH5pGl7Q=
X-Received: from wrue9.prod.google.com ([2002:a5d:4e89:0:b0:40f:b976:8cba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c7:b0:425:8546:6870 with SMTP id ffacd0b85a97d-42667177d60mr12376827f8f.21.1760347345039;
 Mon, 13 Oct 2025 02:22:25 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:22:23 +0000
In-Reply-To: <DDH1DE35H7L0.1Z2R655P701HR@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-2-markus.probst@posteo.de> <DDGHGF4XOJQG.2MVGBMPK0KUQE@kernel.org>
 <e550b0862e9ea87e50688d1ec8f623638d170a3a.camel@posteo.de>
 <DDGNXV9KS3RS.2WHS4OOYM6DOP@kernel.org> <2a31fcd045582382987c8c1da7c4b7d58a1dff61.camel@posteo.de>
 <DDH1DE35H7L0.1Z2R655P701HR@kernel.org>
Message-ID: <aOzEz23fWxHZbvdh@google.com>
Subject: Re: [PATCH v4 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Markus Probst <markus.probst@posteo.de>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 13, 2025 at 10:03:19AM +0200, Benno Lossin wrote:
> And `Vec::pin_init_slice` would have the following signature:
> 
>     fn pin_init_slice<T, I, E>(this: Vec<I>, flags: alloc::Flags) -> Result<Pin<Box<[T]>>>
>     where
>         I: PinInit<T, E>,
>         Error: From<E>;

We already have Box::pin_slice().

Alice

