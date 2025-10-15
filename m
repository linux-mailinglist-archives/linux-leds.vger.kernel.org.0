Return-Path: <linux-leds+bounces-5792-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D78BDFD87
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 19:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C732B4EBF1D
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 17:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E273633A002;
	Wed, 15 Oct 2025 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C42KKnd+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD4B338F21;
	Wed, 15 Oct 2025 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549283; cv=none; b=IHeXvx41Orf/U4bH65KTlqJck1HR5PInm8caub+PZ/IczC3rFHYRehwa9wSoA71y9rB+bBusixRESInOp/cfGmV7Eh+1vbcCeXFCBJ9QwZ9CTNCxnMUYbwF7jA8+9PIKl3hWWK0Lfm1K9ufWxsz4cEnToAWptIfEGU5bpGjrB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549283; c=relaxed/simple;
	bh=ygYSReZYoQQfbRjOy+h8AzmtWJKt0WboxvKPa7Hw9C8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=iu+K5Yah6LzoCazl6WbSqAzqJlU1586SfTqcRRdkeT9dMaXrcabB/tA0VbYkFf6ORFGZ13qchrNDItZMftBB//7azuK0ulj56eOYMtgmopBtzuWl3dPAbV4HHmYe9uwMv3sEYIFCicWFjJLQ5C0Gzu9zq40bsR9hC0xIx+o24po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C42KKnd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FACCC4CEF8;
	Wed, 15 Oct 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760549282;
	bh=ygYSReZYoQQfbRjOy+h8AzmtWJKt0WboxvKPa7Hw9C8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=C42KKnd+nGR/z5rWWtWTRKMwIyDtCmvAvMXP14LddLR2sL6+TwO8GN+u29mr1Nkdh
	 4yajPj7C8oVRQvwMv/WwFRaeMMyx0M6W6sGtzwbmqjCNQfsnKsp9w3txsQKqDe1Dy4
	 cqcVuloPCf34TxVjHhAfM2YM6rS0DXVLmvj1Ms9dwGdlYBRDPzwbJURQGDdJC1YKwd
	 617REbHxu3TnQjqno/csNuPZSJ7wmjVFCje28musun5pQKuQH6fUbFuDX29Vii5k3I
	 Z37tgPS39MmqXXoHBmwMJC0ssoc8bGHG15KGTaFSNrsQSODuTVLvTIAo3Jr4v4lZ2u
	 w4osYN5QgxYJA==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 19:27:57 +0200
Message-Id: <DDJ2MSQ0UJQL.199XI9U29HPXL@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-leds@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-3-markus.probst@posteo.de>
 <aO1GM4WXs37Zpm0G@google.com>
 <7de58fd25b52dd5195c8ac06ed4df5a1e60e5070.camel@posteo.de>
 <DDIZC4MK2CFW.1DPDIJR4HPKGY@kernel.org>
 <25f3fd337ce5e58915125c4e2eb85ef4d7af3627.camel@posteo.de>
In-Reply-To: <25f3fd337ce5e58915125c4e2eb85ef4d7af3627.camel@posteo.de>

On Wed Oct 15, 2025 at 5:02 PM CEST, Markus Probst wrote:
> Not necessarily every, like I said `container::Device` itself also
> would implement `device::Container` (still allowing &Device<Bound>).

Sure, but eventually we'll need all bus devices to implement it because you=
 want
to be able to use this class device on any bus.

> We already know the address of it with the `struct led_classdev`-
>`parent` field, we just need to substract the offset from `<T as
> Container>::Offset`, and we have the address of the device container
> (like `struct i2c_client`). No Box needed.

Yeah, that should work.

What I still don't like about it (and didn't like back then when I thought =
about
something similar) is that this provides a publicly accessible unsafe way t=
o
upcast from a generic device to a bus device.

However, I do see the ergonomic advantage for drivers. Even though I'd say =
it's
minor, it is indeed nice that the class device callbacks can already carry =
the
actual parent bus device.

So, I'm fine giving this a shot. If go for an implementation, please name t=
he
trait something along the lines of device::IntoBusDevice, device::Container=
 is
too generic. Only bus devices have a DeviceContext.

