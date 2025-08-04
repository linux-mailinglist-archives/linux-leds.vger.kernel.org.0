Return-Path: <linux-leds+bounces-5195-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD5B1A0B8
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 13:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52F51895C72
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 11:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834D9242927;
	Mon,  4 Aug 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LKoanhbf"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646722D7B6;
	Mon,  4 Aug 2025 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754308213; cv=none; b=hdhL8RaVYUQDOW9taHvJELx9jQyRAX7JaCZG25tD1Xu22kiVD6D1LRy8Ey2hpXLXOjQvI28yX1hFaKOtQ6MtTuGtXJteh8BO9/w7TLgOZnf2QCtxNGgAhnZuCMmfriyzXv+cASL15+tRcHZNrm7qwibHGAzy13cJDbSbWUn0ovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754308213; c=relaxed/simple;
	bh=iHbGgYo0EDHXovgqdvtNWnLIICRwvlJOp54R3xC6DEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lU2KIlzUoXNRfR5NwnX68u1HfeLLM/0ubfqV2/Jb4KDsTZQmrMl6yoGB8nlR3OmvH4EsKMy90heDuVnenJDt5KKphWCia5Udvi5H8259ucr1fX43xi8DjhM25ZL3uBzRGKpqtJr9aXqumnHVhGuRsHAbk5IoKmfApWld9uD4oKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LKoanhbf; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=dBrbqTDJn72ccQuWk0JwGvU6I4m2nNaU0SHr25slsow=; b=LKoanhbfQDYXGzILyFrWYogMiM
	fJX3XgW694oar8V5+WcfM7Jm/B6xTLmsFCdGglAlH01l5NX2jvoIWM7yTOy/H8bIuEz4UcPnqm2uV
	kGb44Nna7px7d45eqfh9GPp+iAfu4g9YMt76yK6zQw0HzmpLMSwwu/qXT0Fs2Tn7AmnAOWVxCecQL
	aWdT6ctlQZFG2SmAfrkRD7XfQv7D5406qr8SxVela3tUogLzB3UJI0ulvC4GTVTxpyCfSgGl7BwBB
	JO39hgP5rVGpmZf5C4p6gEc5aQgOX2XCFXFP7ygw0HjDG5Rz35SpBzMx+0i0PBOHBPXG4/dTf9VFw
	juUHZoow==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uithc-0003cE-3e; Mon, 04 Aug 2025 13:50:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: heiko@sntech.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] qnap-mcu: add support for the status LEDs
Date: Mon,  4 Aug 2025 13:49:47 +0200
Message-ID: <20250804114949.3127417-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the status LED controlled via the MCU and clean up the usb LED
a tiny bit.

changes in v2:
- add patch to clarify the command "area" of the usb status LED
- captilze LED in text areas (Lee)
- use 100 chars to prevent some line breaks (Lee)
- added the newly found state for "both on"
- don't forward declare struct, instead just point both LEDs to
  the red one, to allow resolving the parent struct and shared
  setter functions


Heiko Stuebner (2):
  leds: qnap-mcu: fix state numbering for usb LED
  leds: qnap-mcu: add support for the red and green status LEDs

 drivers/leds/leds-qnap-mcu.c | 175 ++++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 5 deletions(-)

-- 
2.47.2


