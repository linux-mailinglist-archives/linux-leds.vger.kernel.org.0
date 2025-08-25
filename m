Return-Path: <linux-leds+bounces-5311-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C194B34ACD
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 21:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FE92207A50
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 19:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E119728137A;
	Mon, 25 Aug 2025 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b="bT/9axJC"
X-Original-To: linux-leds@vger.kernel.org
Received: from m101-out-mua-6.websupport.se (m101-out-mua-6.websupport.se [109.235.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3623BCEF;
	Mon, 25 Aug 2025 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.235.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756149266; cv=none; b=p59mZBKDsGdWFuiuoU3If6iuTGzrhLEsVYGc99Jr//FH0jxapHDoz+KFz9ca59rpZEVQYeEncI3TqHdAPlpxcfOUQsCyGuC1+UvWB4bepy+z2d1ZE5LA+7FLCzad4I7YW0IFB9DpCDKIFguLzOijyxGgv/Xs+CV6UeoOOWNYsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756149266; c=relaxed/simple;
	bh=k46bUg4VPtvIWCaMHCfix4FLIE4JV0woTpaHdDa3ARI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aD5RuKfzyxbo+h5vJ8POwhUNbFK+DVqd0svBFNVO3L2zOusch8U2VkDmS2R68KKig51OnpBzXYOgcag3i2YjXxhfrHI+7T8owOru0Dqz642R9CDwThDxSk9COCleHUdiBSQgLcBduDDJ9ZyUe9Oo1G5hkgw32nTXblXUOlSqX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se; spf=pass smtp.mailfrom=palvencia.se; dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b=bT/9axJC; arc=none smtp.client-ip=109.235.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palvencia.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1756148930;
	bh=ukDsuI8s1UxUlNDIszPLCcP3lTY/1qlseTcq02pRApM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bT/9axJCPjJTbKMVTb11wCvMv1l78VnOc0K5h5YC/GH/wKbJeUOYc7iI4kiLfkZ1w
	 Pc/jEzVqdqhShptvbmJ9GIRgWNUJ2o0cxL18cNvG/IeBiW+SqOhAaHlul+yNEpOUmb
	 retkJo78ztHLYyAJfV+BZDuKBIbPbsVpiP4GK8065BQsZwp9fP5ZNQXDky69gmPXtC
	 uOsE4txiazVgTXZUBgeRqnNeN9bIQ5M3xIIPwlNTsCJdxLtjLEVrT67ECRhqzI+OCT
	 0RxQDZF6mz0zGcbe2khxi2eUNxr820/GL5K+Yd6PYXOuPFKOXbRCpf5QFA87H2ZjcY
	 M0HbqMZ3LbCyQ==
Received: from m101-u5-ing.websupport.se (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4c9gLp3JKYz1wn0;
	Mon, 25 Aug 2025 21:08:50 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u5-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u5-ing.websupport.se (Postfix) with ESMTPSA id 4c9gLn434Gztmd;
	Mon, 25 Aug 2025 21:08:49 +0200 (CEST)
Date: Mon, 25 Aug 2025 21:08:36 +0200
From: Per Larsson <per@palvencia.se>
To: =?UTF-8?B?SmVhbi1GcmFuw6dvaXM=?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
Message-ID: <20250825210836.71fb0d0d@rpi>
In-Reply-To: <20250825033237.60143-3-jefflessard3@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
	<20250825033237.60143-3-jefflessard3@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Out-Rspamd-Queue-Id: 4c9gLn434Gztmd
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_X_AS(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Out-Rspamd-Server: m101-rspamd-out-4
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 353
X-purgate-ID: 155908::1756148930-06102069-1237CFD0/0/0

On Sun, 24 Aug 2025 23:32:28 -0400
Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com> wrote:

> +  - Digits use 1-cell addressing with explicit segment mapping

This new digits layout introduced in v3 implies that a
different segment mapping can be used per digit by a
single display/controller. Is that really a thing?

Regards
Per Larsson

