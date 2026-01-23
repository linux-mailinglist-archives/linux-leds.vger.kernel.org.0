Return-Path: <linux-leds+bounces-6718-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCWMOWzGc2lZygAAu9opvQ
	(envelope-from <linux-leds+bounces-6718-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:05:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82679F67
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 390103009B38
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B871D2652A2;
	Fri, 23 Jan 2026 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="VBa2z3Bg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F7223328
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195113; cv=none; b=XTbZ/SvmR4solOK+7HDTv6GKtqabRS7wZSV3X23rNll/VukwNNH/1EhbzraW860mWd6GWbwG1JyV4WA0vk8yxtapkX7RIeYSmQm9Goqxs14/5slfQGk2+wy0v4Zdzjdwy9ResSaaeso/C8+It/UyiUs6+NlvcXoOgHRwFh48dPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195113; c=relaxed/simple;
	bh=/cHw1n1vwCGBgffq5s3wwFhFVk2mA2T4hOZdEWay4Zo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a9dscBfX2K/DRNp4cpClu8NMPMFNdomVhrGHHnHI0lgns40X3ZlOdMYXbAvfv8jEqzDtTYE+kqa4aDOziUlCgUotAJGpmcK2a20qpcMzFkzj7KRfWTbCpTDh1JIa7ey2o3OJlxeEBupoHZ7aZmGQlo9X69WBBkYKTGcqpyanFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=VBa2z3Bg; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id EF9D1240103
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 20:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769195103; bh=S/obxhDnOp2XywdlgDPwwAeyf4CrWqyNlDbhViEkD68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=VBa2z3BgqrkhnNEeAiVYQop678HvjVSbo5EAqDI3MO7ZmPMiebzNHEmOYCqtEpn0i
	 KRVZtSnGB7QCka0GmKTIysrAljkRkXg7j8qoii/XfuWwbweYb09aXnHRwBGtVYUD5s
	 pWR/BG+LcsF7tP4ST7NXsnA+c1XF/2GSHWrrk74n09clKKy9L6f143AWqbzPqTxlh1
	 v1viZZPQ1h3gpzDusEBjfc6q5eIPC8aWGyuyRTjlO+wLrZ1mpEL1T2mq0ehF8CczkF
	 PmZbJF6VWSUly9cHwrqXnNXBdhNftRv7d+pIGbUTUuk2RXsWw6OlAmYfAyikEZTyM9
	 +jLzn+xVWDrqA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dyS6h5ZTVz9rxD;
	Fri, 23 Jan 2026 20:05:00 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH RFC 0/4] leds: extend disk trigger
Date: Fri, 23 Jan 2026 19:05:03 +0000
Message-Id: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/Gc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3ZzUlJKizPT4lMzi7Hhdw0RTAwNTY0MLM9NEJaCegqLUtMwKsHn
 RSkFuzkqxtbUAaJWu5mQAAAA=
X-Change-ID: 20260123-ledtrig_disk_-1a500531865a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=/cHw1n1vwCGBgffq5s3wwFhFVk2mA2T4hOZdEWay4Zo=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpc8ZGBSNOretrYotHtqPLMZS7oI9v+7TbFvuKb
 PCBzda+Rg6JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaXPGRhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9JRBQ/+LOQhf6eVT/8SM0o5N9DZrIjRCgQWYOz
 SECgrECT0KaPRx3DQg50F1XamEaG+O99WNNYn61QmIYJTjh4vff4ZZOEKl2TOuIuc8gcSCf5fgj
 Teh3fs/eRrMrw2snmPAigsNCUzx1zEzzzLg0itjOeR01bmTsbshFy3IfgNIjwanu62QadnhQoDV
 IMgSpACEEEusS2aCrfn13tsJVd50Bxf4h4CJteHFnNTpji1jq/fzxSgiSTMJscpcrtRuL+m+2Ae
 cpLpVh92pNE4YdX8cJrLWQlQggu6gmHiiwnlIL5tnpBkzZQDYsLJkzKtBYwHk067DeML61dfzJC
 8ZtsE87AS/0C5UdqCE20dai09kw35u6VDxpEGPQb8+Kbe1dFHU/rZvtjRyR10TFNDaLpQouq995
 5YRP48GrXjvg3Zec2K7pzEdnS1f9a8bbAfi5pUEryII+iwE8hbnkjoXYfJd+3HW2KJgwZHxRxFn
 Fx1FtGGx/1vAGP05XpVf8f6+RAKCpcjTlPQVs686Pg5HPgvdbPwjfHMwDgyRMJEpoDB/Mp8smj6
 kzESbAY1nQ4HFsx/31K9gFlqUaW7W15KSMSgqUywP4TzRJGBLDnxNT8VXWUj3FbXVSqPdjylfBV
 y23JnqBQa6tuOEUjoBsfOOlg2J73Wz4fEsSlZFQWDG+MPH9xkziU=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6718-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,HansenPartnership.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F82679F67
X-Rspamd-Action: no action

Extend the disk trigger
- to allow configuration of the blinking delays
  and whether the led should be kept on, on idle.
- to allow an individual led to be mapped to an ata port

I would also like to add another patch to this series, only leaving the led
on with invert 1 if also at least one disk is present on the ata port.
The led would then not only indicate activity, but also if a disk is
present.
That is why it is an RFC.

@Damien,Niclas: What would be the most straightforward way of telling
the led trigger if at least one disk is present on the ata port and
notifing it when this changes?

Thanks
- Markus Probst

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Markus Probst (4):
      leds: dt-bindings: add disk trigger led pattern
      leds: dt-bindings: add disk trigger for each ata port
      leds: add delay_on, delay_off and invert attributes to disk trigger
      leds: add disk trigger for each ata port

 Documentation/devicetree/bindings/leds/common.yaml |  10 +-
 drivers/ata/libata-core.c                          |  22 +-
 drivers/leds/trigger/ledtrig-disk.c                | 298 ++++++++++++++++++++-
 drivers/scsi/libsas/sas_ata.c                      |   3 +-
 include/linux/leds.h                               |  16 +-
 include/linux/libata.h                             |   6 +-
 6 files changed, 332 insertions(+), 23 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260123-ledtrig_disk_-1a500531865a


