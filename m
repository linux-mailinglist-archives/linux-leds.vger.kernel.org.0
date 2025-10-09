Return-Path: <linux-leds+bounces-5689-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65DBC8D25
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 13:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF931A60D68
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A22E092E;
	Thu,  9 Oct 2025 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWVUgVvZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937112DEA89
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009377; cv=none; b=VvaRuD/V/PHXbgrkklI7v8FBT6v/WXDufk4eQeDug7Rp4F5lLZYXgCAFh/9zhIh9aJs2CCt+5zg2SUkfrh5Y1yemo3Fs7ppjC6l4qHJGmN55DTCgrt15hSMUEVQRF16ILceHJlyuCLuegMV84ap6GoaijG9fEGOxkRq8U1/G40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009377; c=relaxed/simple;
	bh=8gRLvm/4+KXkDjVOQ4zHDlxZfOn+rnBCPUs7sPbzxAk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G73EqAvUK4yLSXj6GByXOZMS88dc0yooeUItF3RyAqvrcMvhk9TtEc9Aai30NHQcr+BwLyqhFGVa97H81+tN8AXoJJVrPVNHUtGEVEzDbv3Lv/60vJc2K+A/RkUJP2RBYPXvbD7aiYMF2eAjCThM5WlJoDyJg75se+aFfoEV3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWVUgVvZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e4fa584e7so4193945e9.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Oct 2025 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760009374; x=1760614174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Icejpz9ICmR/HbhI7E8FM6WDudvlxzHYJDrZrpd4/Ak=;
        b=PWVUgVvZSNwIgwOkHAjiYDOt/Rx+vx3FKlHQblN02weV4JOUGCorSsakyXgp8USmQs
         psB1csvmpG5l7xphDwVuBYcKYHBUm600IpIOQAfmJ/bntokWM9Oj/ORQfhiA/E9zk6Rl
         dtPWoNQfY2xRW8FUif2bleqpBf3gpXZ9CSDnuFn4HtqXcbNLJIK5XnWuPZMv7qwoPgVk
         IiDtxut5YXhH7qqcoXmcUEKlubFuxc4waFnHIM1ZN/ViCO0cVZxiamQWcZ4JR/3+DXCB
         q7jJDx80j372t/ukvyaWrqB1Q//sQRzmMzSlN5a/K/Mxad8n9ysA4BWtE5FnmuHwzUSj
         0lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009374; x=1760614174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Icejpz9ICmR/HbhI7E8FM6WDudvlxzHYJDrZrpd4/Ak=;
        b=U5GLAo/IObkYqJ+UQDoNaxJ5OoxtZg9jPMnrKIt5kn8W8DLw8V8RNYF9+GvVR9zqmw
         YDPLlHoUR6DJR/CnQ/OcGg7LD+WzKPiFPeJLxfoXQuyfpmL7IJV0iHDOHlIWSWyzc9mE
         /Yz547lJSt1waBKYFYw9yB/ImuEEbnFQ2B2H3iEZcK6L65Gso2U0Qh45plRp0Ljr6IKQ
         QunRSF4GkKHdpdAdhzBY+64HT/IyqdqdGOnyBcHtJgOpuMPXNqBYzwpAEWX0gmK2vpH+
         XZFOTXS4Ch7VCL92Ao0ttT99T59Ox/JZ/8XRfV8K2HtbfYf39RrDd438vdAkKmnxJ3qK
         /pxg==
X-Forwarded-Encrypted: i=1; AJvYcCX9q5wPFWPrh3ToRpCNK8KNA9llbt+oYhjfmNe57BcZFCNI2oSqKzvOIOfd0yp2vX60GRynPUW5q2z1@vger.kernel.org
X-Gm-Message-State: AOJu0YwEf5E0oTLr1xRAyGPKR4ieKYUCmU2Cb7ey70WEbP4R02Sln1xL
	rN/ihrt1VP1xy52D9UZ8ZdSTyq0ysbGYD6yPTGXHkzxkrJzVIcCpXHW/JAz9dXf9L5Id2bOw2rn
	EwUZDXQ8cUXoKOzeqvQ==
X-Google-Smtp-Source: AGHT+IEppe+l/HYnDey+5S61G6gKK0Qvds/9QShFQ18NPgRJoLutTJe3S5yJXRnYIGXj3ynGXe664QfI0/yRTCk=
X-Received: from wmga22.prod.google.com ([2002:a05:600c:2d56:b0:46e:3921:1b1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a346:b0:46e:4925:c74f with SMTP id 5b1f17b1804b1-46fa9aeff82mr51996085e9.20.1760009374077;
 Thu, 09 Oct 2025 04:29:34 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:29:32 +0000
In-Reply-To: <20251008181027.662616-2-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008181027.662616-1-markus.probst@posteo.de> <20251008181027.662616-2-markus.probst@posteo.de>
Message-ID: <aOecnHYkBYEbUsi4@google.com>
Subject: Re: [PATCH 1/4] rust: i2c: add read and write byte data abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-leds@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 08, 2025 at 06:10:43PM +0000, Markus Probst wrote:
> In addition to the core abstractions, implement
> 
> * `i2c::I2cClient::read_byte` - read a byte from the i2c client
> * `i2c::I2cClient::write_byte` - write a byte to the i2c client
> 
> * `i2c::I2cClient::read_byte_data` - read byte data from the i2c client
> * `i2c::I2cClient::write_byte_data` - write byte data to the i2c client
> 
> * `i2c::I2cClient::read_word_data` - read word data from the i2c client
> * `i2c::I2cClient::write_word_data` - write word data to the i2c client
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/i2c.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 73858aecc131..57b02b65f90f 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -463,6 +463,51 @@ impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
>      fn as_raw(&self) -> *mut bindings::i2c_client {
>          self.0.get()
>      }
> +
> +    /// Reads a byte from the i2c client
> +    pub fn read_byte(&self) -> Result<u8> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct i2c_client`.
> +        let value = unsafe { bindings::i2c_smbus_read_byte(self.as_raw()) };
> +        to_result(value).map(|()| value as u8)
> +    }
> +
> +    /// Writes a byte to the i2c client
> +    pub fn write_byte(&self, value: u8) -> Result<()> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct i2c_client`.
> +        to_result(unsafe { bindings::i2c_smbus_write_byte(self.as_raw(), value) })
> +    }
> +
> +    /// Reads byte data from the i2c client
> +    pub fn read_byte_data(&self, reg: u8) -> Result<u8> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct i2c_client`.
> +        let value = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), reg) };
> +        to_result(value).map(|()| value as u8)
> +    }
> +
> +    /// Writes byte data to the i2c client
> +    pub fn write_byte_data(&self, reg: u8, value: u8) -> Result<()> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct i2c_client`.
> +        to_result(unsafe { bindings::i2c_smbus_write_byte_data(self.as_raw(), reg, value) })
> +    }

I think it would be useful if the documentation for these methods has an
explanation of the difference between `write_byte` and
`write_byte_data`.

Alice

