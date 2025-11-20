Return-Path: <linux-leds+bounces-6245-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3588C73931
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 11:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9634335742F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910A630F537;
	Thu, 20 Nov 2025 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWOcoqYw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC6632E13E
	for <linux-leds@vger.kernel.org>; Thu, 20 Nov 2025 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636094; cv=none; b=nbqEoPMOHl4sgUXw5jsABxm4krquI8GLNckXn2ALWL2kMhoJGv8m10jtBI321m9jeoBxU9bNNaTn57HYiP+RG7J6aCAEtKXyrlKTwprfgY06+QF1tCtIO2MnBtavUELLy/6NEgweiCOhITD2WUmJUFZtUXqWaDa+Ef4NmilSyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636094; c=relaxed/simple;
	bh=VcZczHRii7P42Dh7vHYaf03fIor4sYyqBSnONy8XpHM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pGzO2W7cVmfodkrfvP7rTUK40jlD5dFIyNqEUVN6nleAw0E2Ajbe9I/OwWwjb0BDWQQsxzw1P5WsxnWDud/Wi2I3ZeVhak42XeJT3cmbx0ThrxUqC92xfdoNLW6pHs8TTWBIN10uHLGtFoHllNY+1KEg6SXcJqWBIR7GMMxOTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWOcoqYw; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6416581521eso658915a12.2
        for <linux-leds@vger.kernel.org>; Thu, 20 Nov 2025 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763636090; x=1764240890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UWC2vUhoiQKT9HWF9RvAPRGaUzQ0E39nhqwqb4Wbiss=;
        b=xWOcoqYws2KpNUotW8smS4DOvtQpIQ/d4LQ0vv639lwVqOoX/GxII1pzyHfSFgk4BQ
         auo/vuO3WNN4esnT9aRUjJGM1VhGCdXNx3XOmQYhpu9vOGu+ZbBgjGrwaFQfvoRVfrZx
         cUbaLzzC7dPi8/Ii6RrLVOlwn8oZjRK6G3sUzNPt/9uX+0vNKI8vJpNRn5PMPrAvg+Rp
         GD1X6fgIWpjl3rHkf7nDp26bK3c+G+sh14RPYySgeg/DjiRFsXgLudQBUaR6/3PRng7V
         G+/z1viCJOCPIJ/1KjNuUnmHBzAdcwhRegqJXD0Rd4ZqZAl4Ps1g6tSKvK3e47g52K1M
         aitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763636090; x=1764240890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWC2vUhoiQKT9HWF9RvAPRGaUzQ0E39nhqwqb4Wbiss=;
        b=DLwxXVQJv24e97Ezw5K6KCMtzZGAZvWj+vplFXmkdVyVppvq5TZ1d14ntoGjfcgX1/
         HmaAgEp5O6YSw+3/BfMNT1zLQlyifZZROAEeLCm3qpKJ/uuGD/TEQOCPAqkyLqfeQddI
         /zawKL2nRaF9CVT5Xg41fiJiC2IOAUr/uAe60C6fulbkNCjdlpEfqx+MQ/WaGOxzLaXn
         X0oTdpusLaBRITvueh2CFE+b+BvDD+ZbGDX5lGEwOBqPvBWvYPz+usD5w2WShiS120Vz
         Dv8ezvAjMv95ketdzv+vzURjW760d9XJKXiy2/TTaWxWQp5+i3mCPvpJW+FfGmTxbiw9
         td8g==
X-Forwarded-Encrypted: i=1; AJvYcCVaPEd7cZZdI9RZLX/fQw7VeLNJkXFICcLsj5Tb2YciK7+eVU2JrAmQurQx6xqT6nU5Z//0FLrEe0va@vger.kernel.org
X-Gm-Message-State: AOJu0YypyEu8qZt4KpjrMzvaQ6jw0MXLFBnY3QBTOvS+B7aZSVwRqW6Q
	Abxw4egwY2hZsE9uUGDJCxRiP5L++9Pv7KHQ4IH5+uESEhTcV/JNldM26V8FKU8zEUOzQJaeiqf
	+Ph+zILQy2qNJ+swcYg==
X-Google-Smtp-Source: AGHT+IGliQxOKFQqN9h5kfToOYWOfJDypiYEqvzX7eAWx84z4F4174qDJV6PGp2krjM4J8oh1xrGD724VU7L7cI=
X-Received: from edp1.prod.google.com ([2002:a05:6402:4381:b0:641:661a:2bff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3909:b0:640:b3c4:c22 with SMTP id 4fb4d7f45d1cf-6453645a4e4mr2260374a12.18.1763636090330;
 Thu, 20 Nov 2025 02:54:50 -0800 (PST)
Date: Thu, 20 Nov 2025 10:54:49 +0000
In-Reply-To: <20251119-rust_leds-v9-2-86c15da19063@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251119-rust_leds-v9-0-86c15da19063@posteo.de> <20251119-rust_leds-v9-2-86c15da19063@posteo.de>
Message-ID: <aR7zeX-akq2Zyf8B@google.com>
Subject: Re: [PATCH v9 2/3] rust: leds: split generic and normal led classdev
 abstractions up
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 19, 2025 at 02:11:24PM +0000, Markus Probst wrote:
> Move code specific to normal led class devices into a separate file and
> introduce the `led::Mode` trait to allow for other types of led class
> devices.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

So it seems like the goal of this trait is to support both normal led
and multicolor led under the same code. However, it seems the traits
involved with this are pretty complex.

My primary feedback here is: please consider if we can avoid these
complex traits. How much duplication would it really take to just have
two Device structs and two LedOps traits? I think a few pieces of
duplication would be far better than what this patch does.

In fact, I'm not sure you even need two LedOps traits if you did that;
it seems like you could even get away with reusing the trait for both
cases.

Alice

