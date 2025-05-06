Return-Path: <linux-leds+bounces-4587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C2AAC58B
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 15:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97E9D5072DE
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 13:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802CF281343;
	Tue,  6 May 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jxA69Nrt"
X-Original-To: linux-leds@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08327280CE8;
	Tue,  6 May 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537319; cv=none; b=JP+avRHltH15/L9cM+2ItW4Mc2pYCfTRMYzK7V0S7jDm9aHi9Lz+Kvh4J8f0GkpPlPWYBS5puRpYJP52v5vlA8Z7/JiUnaeMVIcdZnuvjPDHyXcJ2LOtTlfcsAXpMF35yJqMWWOjIkTD5Ne5jFmUofGWm0sz6FSQT637qA/4p4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537319; c=relaxed/simple;
	bh=iDpakBmy34CXU54CTiScl5jnXSHf29nCAHf2ZwVLYSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VJKIk5EfX7h4TX7UBCi7o7vbaV+6UYsqFYwxxwivGS89/HOo9aRc+wkaiE21FnjIOuRJ9rvuiqzoTZki/Mz2Q4PY7fsyYKOiYrlWtANkEsYWtBJocMTXRresBUEn3BSN6w1op2DaJZ6IE8HTxDEif5giO8/RFmNrYIFTc2A4Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jxA69Nrt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5752841080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746537317; bh=lftdM96Gj29LMNahG5Po8moIghx45Bchu8Qkov4iPNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jxA69NrtRcaVVq6qDMzpKLyGWUDju0A3gx0FnuOfQC5TFYkA9tM2O7cbQguElonSp
	 Lhw8grInaodyMOq1L8poSwI1sMTxTUjXHiNLZRQCJwcppaq43/fh3oaRGghy6jc0B4
	 JY25RfmV9yOYQf+7oFcfbr4W2bYh2kkOIs47ySO3yjUWM3rGeSMoP8s1W7f0cBOthP
	 IKjFKuD9EgyEZ8YNX3ba2g35ZgQGjwod82fSJYzDJLYFdY8rpdrY4iolQSJbCT7/fe
	 5f9RgcMn5TfhtEp0yw5PPHksFKbisRaSvu5l9OfZfCuu9i3uC2zSrbr9JSMKWKYCtq
	 5sRaaHu8MfX8A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5752841080;
	Tue,  6 May 2025 13:15:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH] Documentation: leds: improve readibility of multicolor doc
In-Reply-To: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
References: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
Date: Tue, 06 May 2025 07:15:12 -0600
Message-ID: <875xidx4m7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> writes:

> When reading the documentation of multicolor leds, the HTML output is
> not easy to read. Improve it by adding a few markups, splitting the
> console in a dedicated block.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  Documentation/leds/leds-class-multicolor.rst | 82 +++++++++++++++++-----------
>  1 file changed, 51 insertions(+), 31 deletions(-)

Applied, thanks.

jon

