Return-Path: <linux-leds+bounces-5739-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF0BD07BE
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 18:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0E34EAE26
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 16:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB4F2ECD2D;
	Sun, 12 Oct 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz6FM0IK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F92EC54E;
	Sun, 12 Oct 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286474; cv=none; b=qWVgPfELXTI/5kjmrSKfkvS3jmDh+TFqVag3PGbsNYcWKrERN335Qj74h5+FeIL9rwHSqCnL0Mk7YBsesAyA2bWtwEp3dxDTds2+JczmiK44/ACPOxbutQ3R3QQW+UZaksApqHGKSVswxtRAxFMOyE3eCyeRrxM8i7frELx8puQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286474; c=relaxed/simple;
	bh=cmP+8n5wAxoO8Qpo2YpOVTk4GDyax34FMdL6dF8jsHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BTRSQpQIaRGtiw1R3b2QO+oytdSnx9pFWx8k5cqwz2EYg0GWqCep9SRv5Jv7Ak84g4PPg3Ug5EvApG1S2O89+2Swf68gSta2ndaFzfNCDEVbF74VV4ZIUN2gcEOeXDtXViXNJ4keAGWoY7WyTjbaXpx/FiZKbuOyPxMVCv5xZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz6FM0IK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B97C4CEE7;
	Sun, 12 Oct 2025 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760286473;
	bh=cmP+8n5wAxoO8Qpo2YpOVTk4GDyax34FMdL6dF8jsHs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Dz6FM0IKW5XmV1bUxLizHfXy/mYXpqTjjbePAqVFygNLTC7CIET0hgkcRFpTpOuoM
	 pqqYCWQgFb2AAFOG5T95ipVfYeWnE8FpVdJh5FbKBCTLFrJcMoCf8+KgtIAoHvnQhi
	 Q8rALukaXkyUtbu70joJI4kNcM6DJav9JL9S7wGtsVgqVvRTrro8aQ3AiBLVtL7AV5
	 5OckmOlHYHczKt+ZY1x5UuS+bIAConDXDNpyMJqJPcIFHtr54Hgdv6aAJzmzDnxKwv
	 BCUrSkTOGlFiapUMfg7ZLXSputoDwnI7orluOnO1/4eNUA2+X+NYP+EDHumpwlHjPT
	 9wk3sunlbjyPA==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Oct 2025 18:27:47 +0200
Message-Id: <DDGHH3LYULXQ.1GHK75Q9GK2W6@kernel.org>
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] rust: leds: add led classdev abstractions
From: "Benno Lossin" <lossin@kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251012145221.172116-1-markus.probst@posteo.de>
In-Reply-To: <20251012145221.172116-1-markus.probst@posteo.de>

On Sun Oct 12, 2025 at 4:52 PM CEST, Markus Probst wrote:
> This patch series has previously been contained in
> https://lore.kernel.org/rust-for-linux/20251008181027.662616-1-markus.pro=
bst@posteo.de/T/#t
> which added a rust written led driver for a microcontroller via i2c.
>
> As the reading and writing to the i2c client via the register!
> macro has not been implemented yet [1], the patch series will only
> contain the additional abstractions required.
>
> [1] https://lore.kernel.org/rust-for-linux/DDDS2V0V2NVJ.16ZKXCKUA1HUV@ker=
nel.org/
>
> The following changes were made:
> * add basic Pin<Vec<T, A>> abstractions, that allow to initialize PinInit=
 items with
>   the guarantee that these will never be moved.
>
> * add basic led classdev abstractions to register and unregister leds
>
> Changes since v3:
> * fixed kunit tests failing because of example in documentation

Please give time for more feedback before sending a new version.

---
Cheers,
Benno

