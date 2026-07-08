Return-Path: <linux-leds+bounces-8976-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xcJqL7LTTmqNUwIAu9opvQ
	(envelope-from <linux-leds+bounces-8976-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:48:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702A72AF24
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:48:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.net header.s=s31663417 header.b=clpnPCPg;
	dmarc=pass (policy=quarantine) header.from=gmx.net;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8976-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8976-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 706D830BAC70
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 22:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EBC385D91;
	Wed,  8 Jul 2026 22:47:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E1026158B;
	Wed,  8 Jul 2026 22:46:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550820; cv=none; b=ZbY0b/9aMchSgGmBy+FoXAxBMmj177RLKUFQGMpSinZtqjqrRD70/j0gemuP20OIyRhYJxye3zoDng7meEzDkAVPHJHVIXbIAeHPFjAS0wzC34WDL96CdARw4YfFT5xYmkOT+Qs6flDPaa1hIR1dkAXLUimjW8KgTvJxH5/XWL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550820; c=relaxed/simple;
	bh=rnJhDkeb5YtbSztG5rKH1adVqoN3oYiNW6gyzMeBfVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vvy/j6vtg31yhHEntXB2cqpwsiIIWbJfu0jmerLPDntnqabdWbeg6uFS98ANamd1M3H75izjlwFO6z6YPg39C8/Yk2wJCg+0O54mBo5oDIA6+bQTUlVa/2LLpDR0QFA4WwGfMiPTURTdEiS8e6SuPM2687mBCuPV/QU/93pnNv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=clpnPCPg; arc=none smtp.client-ip=212.227.17.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1783550816; x=1784155616; i=wahrenst@gmx.net;
	bh=LQ0BtL9cRW8OCqJK1EcFmvKj+YUM/QdVPEo66ut1y2Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=clpnPCPgqKmV4NiJzXLy3H3SwW7dmt7wRsk1EYaFCgt4xnJi8TyiiA0hb3nZ7cHe
	 60ZTU4wi0IinZn9zSEYGwtGdBHJZdf4YwGHxsN2Ppo8q2BK9YtGZBabsV0sWlv31j
	 EuHP+D4zLwu5NdfG7SX2n9rm6HzFPPXthTVGsnnZlTw3EL7iJWQ4CNloeEsOXARtO
	 aZalQN6vQViQdEPhAog7OskEMRGde9dR0/uC1nAQQwqff4gh6PPQtyaT/SGdc/YHo
	 SjNFcSkgSOEm4T2tsZMALwtSj/6pPDfhGHc5zjgZu4W7Tr2VQOJSPXFXUWyOoCeUN
	 QdlLO/BTy8oBse8GsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1x1zw03fU7-00u0xM; Thu, 09
 Jul 2026 00:46:56 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 0/2] leds: rgb: leds-group-multicolor: Introduce default-intensity
Date: Thu,  9 Jul 2026 00:46:50 +0200
Message-ID: <20260708224652.106632-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GYmynMVlCXiKPnFbLDd637kSNjVrodg2SbdD8Wok2uTFD2vEZdG
 2wwrAFhJrF7Y3GJ5pEwQsIBbZi5uvqqCL9kyZ05sMdYNqAoq46CLXM3p9sViw6f8yTd0cUh
 p1TcdMEiByChVZch/rbS5p9YxZsVEdutUjO/NVASDQBN9YeVOuWV0PQCZ5cshTCOUzEzLj+
 F6MCd1v5mZW6LioowVkMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pLtoKQDgeRc=;1hbAU6lYXjjgEzzWGXaFi0hmJSp
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8976-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jjhiblot@traphandler.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:wahrenst@gmx.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[traphandler.com,vger.kernel.org,gmx.net];
	DKIM_TRACE(0.00)[gmx.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2702A72AF24

Currently it's not possible to specify the initial color of a LED group
during boot. So introduce a new property similiar to default-brightness,
which specifies the intensity of each LED in the group.

Stefan Wahren (2):
  dt-bindings: leds-group-multicolor: Introduce default-intensity
  leds: rgb: leds-group-multicolor: Implement default-intensity

 .../bindings/leds/leds-group-multicolor.yaml  |  7 +++++++
 drivers/leds/rgb/leds-group-multicolor.c      | 21 +++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

=2D-=20
2.43.0


