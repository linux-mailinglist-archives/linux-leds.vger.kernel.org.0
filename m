Return-Path: <linux-leds+bounces-5714-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C4BCA7F1
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 20:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7D719E87CE
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 18:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3E72E040B;
	Thu,  9 Oct 2025 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="QixaY/2e"
X-Original-To: linux-leds@vger.kernel.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8825B2FE;
	Thu,  9 Oct 2025 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032740; cv=none; b=CTK6lp4nVqKP0/2i4D1I1FlyQZYUwF8sYy9Xe1KqTZYoGWUzL3XYZjcJ7n3v4mjpUs4Bc63a7bzGYzqEs4tkVbxawtmoKexYeiQ3jqLnyWC84Z/itk6rDxeoelqgRu5VmWRUBPy4/niA50KRBEVChyomKWPn+2lYtLGq8sYsOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032740; c=relaxed/simple;
	bh=do+lzg53tTjYsSVvQe6ba8IcToxYSyl8FIvIOKaRQr8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRbGbqPC88ZkH6VigpBwn85bzMlGoceG8tHfbAwclzAdp9JUJwwy4pJStn69fWb+rs6lIaAwVT8STi8RBHxi3SHctSYYe/t4olavDdRjxHMV/yImEqjiRJkglyMsd/S2yTb4WzPp9nSiWSvZ8Sof3AugDaBfKqAnyIHgNnOm3n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=QixaY/2e; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 39D1C8146E;
	Thu, 09 Oct 2025 20:46:39 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XkOODJdLESw0-FXuZtZYA;
	Thu, 09 Oct 2025 20:46:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760031998;
	bh=T4yWSArpyQ7TQ6m6w2mktC7Pnb+v+PNnmRHM3h4QuZk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=QixaY/2ekimsEtLEMDbUoKVthHGErp7ybHp0o5gItUQrk76tJylRUTkOyUJFOmKBS
	 MVXJXXGRtgultRI1wgLzFkVFgBDd+Mkk1WlIVTbT1vOJ1l8aVxVhD01RzKrwtVx7ds
	 35uukEVSGBrPjjxpuwH1XRi6nWMJRcYGu20HUvlc=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 9 Oct 2025 20:46:32 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: leds: add led classdev abstractions
Message-ID: <20251009204632.16cfb175@nimda.home>
In-Reply-To: <20251009170739.235221-1-markus.probst@posteo.de>
References: <20251009170739.235221-1-markus.probst@posteo.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 09 Oct 2025 17:07:55 +0000
Markus Probst <markus.probst@posteo.de> wrote:

> This patch series has previously been contained in
> https://lore.kernel.org/rust-for-linux/20251008181027.662616-1-markus.probst@posteo.de/T/#t
> which added a rust written led driver for a microcontroller via i2c.
> 
> As the reading and writing to the i2c client via the register!
> macro has not been implemented yet [1], the patch series will only
> contain the additional abstractions required.
> 
> [1]
> https://lore.kernel.org/rust-for-linux/DDDS2V0V2NVJ.16ZKXCKUA1HUV@kernel.org/
> 
> The following changes were made:
> * add basic Pin<Vec<T, A>> abstractions, that allow to initialize
> PinInit items with the gurantee that these will never be moved.
> 

"gurantee" -> "guarantee"

> * add basic led classdev abstractions to register and unregister leds
> 
> 
> Markus Probst (2):
>   rust: add basic Pin<Vec<T, A>> abstractions
>   rust: leds: add basic led classdev abstractions
> 
>  rust/kernel/alloc.rs      |   1 +
>  rust/kernel/alloc/kvec.rs |  86 +++++++++++
>  rust/kernel/led.rs        | 296
> ++++++++++++++++++++++++++++++++++++++ rust/kernel/lib.rs        |
> 1 + rust/kernel/prelude.rs    |   2 +-
>  5 files changed, 385 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/led.rs
> 


