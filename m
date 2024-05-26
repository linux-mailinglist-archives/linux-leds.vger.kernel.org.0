Return-Path: <linux-leds+bounces-1694-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 269288CF404
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 13:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D615D2814C1
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 11:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97528D534;
	Sun, 26 May 2024 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="eVMliy08";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="eVMliy08"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx107.easyname.com (mx107.easyname.com [217.74.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD8D524;
	Sun, 26 May 2024 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716721842; cv=none; b=kgH0hRmNFB7OZcVWRn59wfZn1yb/6appc/7y90hyBEi0SY1xTNzpHMvDTvJwEpHW6EPS/Zzazf+qX48TvvCOrywjsJzLf8JXwY7Wdd3PTXrrukdpeRWU7VemXbMlCt8lpb/ulFyv9V6Xth9YUJ1vWppS/Y2cOqfa1ZzMjNOAeB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716721842; c=relaxed/simple;
	bh=FSzONcmAL58vinmBF8IEjcRWq/HhTFkgIH7TtQ8hLHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4oJZNSwKLdJFFXJpvmlpnjhUKgaeMLSxPeoGXa4b3hlFaHuaBUKZj2I5sw98C8FsfV4TxUxdtsZk2coWUYzjWA5iWqfW7alVnNWN6xqvSwjDgZmimugxmOIpvnFQnIcfkhCwpy57HPjbwndV0vXKLu9gNpV1+q0BAvq6jOXGHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paroga.com; spf=pass smtp.mailfrom=paroga.com; dkim=pass (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b=eVMliy08; dkim=pass (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b=eVMliy08; arc=none smtp.client-ip=217.74.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paroga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paroga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com;
	 s=easyname; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3aXGfsIt9R394loRp+3WF8arPd+Dmc7dX8LDibAPSlU=; b=eVMliy088Ng/ln3LbHY2H9U50a
	hl5Lt0SocfhopF/klQMQTmR1AXoG6Z826v9P7vDe+wJp2R9VDiMgVAbvgAw0UbL1auFwWSCM+TKJ9
	1LLUamA8Shwza+nl7mTMPFFBRC85G/xNsJMy5LzQMWq5WHJc4MD2X53BGmyLoUAWuu69H6ZXArIhD
	FVA7bmrL7LTAfkY+yPoiDrRw2oFN4nENaRhLfPs9J+j/gfqVi7Rw3ZxkYLa5c6bHzPE5mTBT/5ngA
	hQei/QBGfP0GOUlbS1GLpHmQfzQlv1QFx1+KldidxXCm7XObs1y5nqbysqYwemKc8P7g1sbLX5LEg
	RIVrgw0A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com;
	 s=easyname; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3aXGfsIt9R394loRp+3WF8arPd+Dmc7dX8LDibAPSlU=; b=eVMliy088Ng/ln3LbHY2H9U50a
	hl5Lt0SocfhopF/klQMQTmR1AXoG6Z826v9P7vDe+wJp2R9VDiMgVAbvgAw0UbL1auFwWSCM+TKJ9
	1LLUamA8Shwza+nl7mTMPFFBRC85G/xNsJMy5LzQMWq5WHJc4MD2X53BGmyLoUAWuu69H6ZXArIhD
	FVA7bmrL7LTAfkY+yPoiDrRw2oFN4nENaRhLfPs9J+j/gfqVi7Rw3ZxkYLa5c6bHzPE5mTBT/5ngA
	hQei/QBGfP0GOUlbS1GLpHmQfzQlv1QFx1+KldidxXCm7XObs1y5nqbysqYwemKc8P7g1sbLX5LEg
	RIVrgw0A==;
Received: from 84-115-225-171.cable.dynamic.surfer.at ([84.115.225.171] helo=localhost.localdomain)
	by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paroga@paroga.com>)
	id 1sBBTq-00073L-Vj; Sun, 26 May 2024 10:52:03 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Patrick Gansterer <paroga@paroga.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 0/2] backlight: Add new lm3509 backlight driver
Date: Sun, 26 May 2024 12:51:28 +0200
Message-ID: <20240526105136.721529-1-paroga@paroga.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Easy-Autoreply: EN

This is a general driver for LM3509 backlight chip of TI.
LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
Dual Current Sinks. This driver supports OLED/White LED select, brightness
control and sub/main control.
The datasheet can be found at http://www.ti.com/product/lm3509.
---
Changes in v6:
  Removed unnecessary allOf in device tree binding

v5: https://lore.kernel.org/all/20240330145931.729116-1-paroga@paroga.com/

Changes in v5:
  Renamed lm3509_bl_led_pdata to lm3509_bl_led_data
  Set backlight_properties.scale to BACKLIGHT_SCALE_NON_LINEAR
  Add dev_err_probe() for first write to a register
  Use dev_err_probe() instead of dev_err()

v4: https://lore.kernel.org/all/20240310135344.3455294-1-paroga@paroga.com/

Changes in v4:
  Use backlight_*() to access backlight_device
  Do not set backlight_properties.power

v3: https://lore.kernel.org/all/20240309132521.1290173-1-paroga@paroga.com/

Changes in v3:
  Improved device tree bindings documentation

v2: https://lore.kernel.org/all/20240308215617.1729664-1-paroga@paroga.com/

Changes in v2:
  Add device tree nodes for each output
  Addressed multiple smaller review comments

v1: https://lore.kernel.org/all/20240302212757.1871164-1-paroga@paroga.com/

Patrick Gansterer (2):
  dt-bindings: backlight: Add Texas Instruments LM3509
  backlight: Add new lm3509 backlight driver

 .../bindings/leds/backlight/ti,lm3509.yaml    | 136 +++++++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/lm3509_bl.c           | 340 ++++++++++++++++++
 4 files changed, 484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
 create mode 100644 drivers/video/backlight/lm3509_bl.c

-- 
2.45.1


