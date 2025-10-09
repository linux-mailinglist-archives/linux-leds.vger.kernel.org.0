Return-Path: <linux-leds+bounces-5690-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B3BC8D85
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 13:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15CD21897B8C
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 11:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955A82D593D;
	Thu,  9 Oct 2025 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLMKakDT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87D2A1CA;
	Thu,  9 Oct 2025 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009819; cv=none; b=uxVddO2Pu/NeR93+EFzDWfDfeq9vQsUHjkz3uAQdwjgfuaCttkn0mv9RE73S7OiPmPkNr6Syii31NTmy+HHQDsBQwQkaZkVO1G/QNVNI6S7SJrwbL73yD4hvfGCQLCfT1I127hz04NsI+b2jjePm+rt2S34cgmaMVWmhueIvM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009819; c=relaxed/simple;
	bh=owqn/ug53Zm1k1QIwrBC8MNF8YMnF2nHZs52jqnG6l4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=KOfCAmgd0FDzE0vSDb5AmamhnBZBBqE0XZALBJnY09jNN8hw9PBDgnQ56nYjKtDofVtbcl+i9N+d9vI3ULmhnSrO637SP5lDR/AEgCJm8WcHnWhmJYKYdWQmtzt0fYXy8YW8hy4kLN8H5m5idVfmFKAMCCDgLPQxH/2n1T1Fh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLMKakDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE63C4CEF8;
	Thu,  9 Oct 2025 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760009819;
	bh=owqn/ug53Zm1k1QIwrBC8MNF8YMnF2nHZs52jqnG6l4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=OLMKakDTdaxU7rH6eTJ4Xl/IhEjHsvsFyKbU/1Hj5vPNJ0PaRDnpC+SQmjTl40ZBp
	 tXEZ1rdvWLRfB2MP9LFzbqrfOYmv5BSzhD5HQIjIuUPQmL6fa2eYi/MK35WoqijyLr
	 6G6eMmPcSIrPWXRlvkJZjLgrMCzwoW/Py7ryTjOAzO6DSKnWeV5UQFYpEbAbcN5HLp
	 u5OyEG7J0EOKZy6Z1fwFeQn/UKtprW0iVu7uzvNMvqrZHSLgoPtCtkZtWXz4dmyMkq
	 qmNZwnUsQE+A+UFJVz0qH+1nP1vtfiJxEdNG6aKAqa7n+LGkJ7YPta2EMa+p3n1iKo
	 wotaoC6n5YhIg==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 13:36:53 +0200
Message-Id: <DDDREQC0DYUQ.3IFRDER24Q0TN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/4] rust: leds: add basic led classdev abstractions
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <linux-leds@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-4-markus.probst@posteo.de>

On Wed Oct 8, 2025 at 8:10 PM CEST, Markus Probst wrote:
> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct led_c=
lassdev`.
> +#[pin_data(PinnedDrop)]
> +pub struct LedClassDev {

Please just call this structure Device; drivers will refer to it as led::De=
vice.
This is for consistency with drm::Device, pwm::Device, etc.

> +    default_trigger: Option<CString>,
> +    parent: Option<ARef<Device>>,
> +    handler: KBox<dyn LedHandlerImpl>,

Those fields are already covered by the C struct led_classdev, there is no =
need
to duplicate them.

Please have a look at how drm::Device [1] and pwm::Device [2] abstract thin=
gs
for reference. The general patterns for abstracting class devices should be=
 very
similar.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/rust/kernel/drm/device.rs
[2] https://lore.kernel.org/all/20250930-rust-next-pwm-working-fan-for-send=
ing-v15-3-5661c3090877@samsung.com/

