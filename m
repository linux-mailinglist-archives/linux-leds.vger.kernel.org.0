Return-Path: <linux-leds+bounces-1435-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1289CD23
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 22:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67121F225E3
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 20:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C337146D6C;
	Mon,  8 Apr 2024 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W0uuhNIB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IFtxMwuM"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21F43AAD;
	Mon,  8 Apr 2024 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712609876; cv=none; b=RTMCWkm6NLxcGEx1s7KfJ5Lf6BSqD+KgOcXPSo92e74BlZX/1jjfepeBmQMXBPaa+ffA3giG2+jXRG7ANAmkn8D0M4DgM86fGb741uC0Vt7h3hexvhTU9p8vWa4nG+jFEYCHKZCawciFBJb4a4CU71idTUHj9MXfONFhigP5G30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712609876; c=relaxed/simple;
	bh=67gTuXdpNGQK5571aAIhNAvLohYoHM4XJBB0HFk8gv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kKWDOMMks0Yi+tU1uCh805pRvzm8nfnJkBETQSBLhXiCb3dYNBNKaTiSaP/rajvTF02v/CK/TvSwV/uztlY6kun5SursaU8fHokmoQJvQ2JuN3gVnjqonm3jzmbdPyiY9ripB6dePl+FkuvEQM1CXF1n1vBlbAE2GsoKnV2X6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W0uuhNIB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IFtxMwuM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1712609873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67gTuXdpNGQK5571aAIhNAvLohYoHM4XJBB0HFk8gv8=;
	b=W0uuhNIBDOPqaJwoxUBWZ3IAGkt5Vl7lUEZbTiPDQOZee+JlrOQMXi83qC3JgUJ/A3JVnl
	X2dOzeMNWS3ERZ9GySQXSAhlGXNSK1jZ/uE2gKRwKhoPneufJx/lrH5GgbuNyGz7vHG/ln
	dCNzbjnzi247bPx0k6GNvYl5c//BvSjIKnfmYmYyyIH9FxuYt3EPFahGJ0JyMWggtvy6Eg
	wJ8WDFGNby80HtSVml8Uq53KJCKGtPdqbnqm6MLGpc0SEQKOjFEHmbeb66nj9lfwBy2Nq0
	2fNPktYUtmi5uyYLcelOySx7bfuNma8jimsDhEZ76QJtgk+1/JA3VxSTqoYp1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1712609873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67gTuXdpNGQK5571aAIhNAvLohYoHM4XJBB0HFk8gv8=;
	b=IFtxMwuMH15gaoSCdTXU55z019DP0SPWbOCtuLMh9tClrF9yEEN8EIDwM4Ox4Wl5FnE857
	ObbppXYbdZHD7xAA==
To: Andrew Lunn <andrew@lunn.ch>, Marek =?utf-8?Q?Marczykowski-G=C3=B3reck?=
 =?utf-8?Q?i?=
 <marmarek@invisiblethingslab.com>
Cc: netdev@vger.kernel.org, linux-leds@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: 6.9-rc2: Deadlock on unbinding network device from a driver
 (regression)
In-Reply-To: <bad26563-33b1-47d2-a62e-723bbb77690b@lunn.ch>
References: <ZhRD3cOtz5i-61PB@mail-itl>
 <bad26563-33b1-47d2-a62e-723bbb77690b@lunn.ch>
Date: Mon, 08 Apr 2024 22:57:51 +0200
Message-ID: <878r1nlghc.fsf@kurt.kurt.home>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi Andrew,

On Mon Apr 08 2024, Andrew Lunn wrote:
> Hi Kurt
>
> Heiner just fixed a similar problem with Realtek driver. You might
> need the same fix here.

thanks, I'm aware of that. The igc driver requires a fix as well.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmYUWlATHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgmL+D/9M6HU09O0fkVNb8G5aywOA+jRiIXHK
ZpcLASGq+yUXQCuTeCmjgrE6C1nCouI0QMolbDHUsFc20Cx7iBwehu4mXu7dVDwf
gin9ymMcPwCd0Fp1eGtgD3No1RqP3d2NnYAJ1emmGt03VyCad7P2hn0ZdMU7V4cP
hiCDrFXjFRY0mN1phtNfOH6umcfNbCq9k+RMzM3LyLlFUdjj9qN0X/oHMf94Glmu
7+mimZyH2ebhRjpJnwMkT8opO8fKoirI0y3yNihP1EOXEGGOXU9quA15oLuuCtFX
DsNdNiTYTBaIkd8BLO0J44aPFVIb4KDRNaXXLdeuj4YbzNij9wJOJESsYIBGW/a0
MVXT8/mOPfwd5gmOtCKRU4MHuUO4Al0zqOmS7qqVbsmA8AxmGnKdWfSRcaBTWIys
wJcA2IBUjnn2tS2jfopR1+Xb6Q+RIMewaW3sNSjE3h8ftExntQJkdr+Jc16DU5G2
bgS5UdKg2O9udz1C6O8f6PRJyfdhL//fj+lljgU0uN9aCXP1QpySEY6FhwXFfJQQ
yjRtWT6jRj+la/niqmlBO7y2JD2YLv5mb/eNBa8Al1XWN9xLnCEgTG86mu28zOQp
uJLnwWzxyCqd8ADvJ0m48s3oAUOapR4pE0GxRNF5jab3f0HNcux85by+4/GRoK0p
WE4Oc9iwmxoATA==
=ueAZ
-----END PGP SIGNATURE-----
--=-=-=--

