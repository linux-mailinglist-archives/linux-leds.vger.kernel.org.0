Return-Path: <linux-leds+bounces-8077-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJs/GZG7AGpGMAEAu9opvQ
	(envelope-from <linux-leds+bounces-8077-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 19:08:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 146975054E5
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 19:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3928300F5C0
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 17:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706033B2FFC;
	Sun, 10 May 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncMDpR4w"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6E39FCCA;
	Sun, 10 May 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432886; cv=none; b=YonrmmY/DtHpCWEJWsNa7k+Va5RVybJ8+O5yEpHEfZq1qd2kF99jY45LdIIqMFdFcaiNdiASufuCHCUssVoXqQBh1Khzea93f7E5hquJwxoUzyIe+m8iXywpW29q28EOOgtL2FXpm8649PqEFsRpkjEJy/Rhzt5VTf0Pdd7O9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432886; c=relaxed/simple;
	bh=j9Ye8Bo4e4CCLXroVD+JMNJOsB6GNLf669OJjbSVu6I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTi7WFmsDwnZxmSk/NaFmE5gTlkCvNvqX8fmfBWmFmBIIaE+N9ed44Sde/hQNQUAN5JzcBqRmXI9mmw8LsKfkG0aVS4YLotDMSW7b89AFHwM4wV8GOWeZ1i17Jt2OySu3DapM4vRV4P/tfyJy2iyFDOhReEa9aScwfVHcUOoTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncMDpR4w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF519C2BCB8;
	Sun, 10 May 2026 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778432885;
	bh=j9Ye8Bo4e4CCLXroVD+JMNJOsB6GNLf669OJjbSVu6I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ncMDpR4wEvVdO2WufqBBelMu49cRmk+imUtCuK/a/t51iIdPCcKvPa199ZmkDrerU
	 Jk+mTpZyvFvYPsX1syuHITyVQyb+IqwQlLzP+kFmsi6xgLIa9lh8Yw7LJBddFECq7G
	 2MVLBRXGxoopwfxMxmHwUVRYFLzClbKVhcL0q1Z94iVPZ0sVLWsX8R13GwELVPXo5I
	 Gp6UoA+EPiE5BUySxmLprRnq5KcQYUY5Cq8xwWopXLCtF62fbsPVon/t2HRMZQg12T
	 qqOI9+3ziD4Vpb4n0zwtkTWdq1gwrVmmwaU695VZbzXHx7IBbYbyMNwmXAG0bJVXxG
	 35WT6K/O9VgMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF9BCD37B9;
	Sun, 10 May 2026 17:08:05 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH 0/2] backlight: add support for Silergy SY7758
Date: Mon, 11 May 2026 00:08:01 +0700
Message-Id: <20260511-sy7758-v1-0-999a33081304@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWtSopd4FbFAB2OBdBDSeHfF8
 kv+cwIwekKGMgng8SCmZY7I0gS6sZkHFOSiIZe5liqTgi9jlBVYaGdV76Q1GmK8euzp/I6q+jf
 v7YTd9q7hvh8sVWe/agAAAA==
X-Change-ID: 20260510-sy7758-e46d85fd0876
To: Philippe Simons <simons.philippe@gmail.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778432883; l=1464;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=j9Ye8Bo4e4CCLXroVD+JMNJOsB6GNLf669OJjbSVu6I=;
 b=xi7FLiPtS8KaNvygEBd7kai0RXgNgf3tewAGPMcel307gKtZBLi1SkfUK93Nvs4rIUSdJSRTS
 rE6EmwAJrwbBrceXgxoALcRSGzmr/4CK13LRMrGtba/6eON2lxG7NLv
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 146975054E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-8077-lists,linux-leds=lfdr.de,azkali.limited.gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,gmx.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

The Silergy SY7758 is an I2C-controlled multi-channel LED backlight
driver used to drive the edge-lit LED strings of LCD panels. It is
present on the Ayaneo Pocket DS handheld, where it drives the panel
backlight, and is required before the panel can be lit.

This series adds the device tree binding for the new "silergy,sy7758"
compatible and the matching driver. The driver registers a backlight
class device with a 12-bit linear brightness range and programs the
chip's mode and current configuration registers on the first non-zero
brightness update.

The Ayaneo Pocket DS device tree, posted as a separate series, depends
on the binding introduced here to describe its panel backlight.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Alexandre Hamamdjian (2):
      dt-bindings: leds: backlight: add Silergy SY7758
      backlight: sy7758: add Silergy SY7758 backlight driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  47 ++++++
 MAINTAINERS                                        |   7 +
 drivers/video/backlight/Kconfig                    |  14 ++
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 169 +++++++++++++++++++++
 5 files changed, 238 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-sy7758-e46d85fd0876

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



