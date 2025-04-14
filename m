Return-Path: <linux-leds+bounces-4468-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2DA884C1
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 16:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7303A8419
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 14:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA6A2918DD;
	Mon, 14 Apr 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b="OSjUkqt9"
X-Original-To: linux-leds@vger.kernel.org
Received: from www253.your-server.de (www253.your-server.de [188.40.28.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA22741D5;
	Mon, 14 Apr 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.28.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638917; cv=none; b=n6WV/qC1JuTIgEfQpCbLcpx0trTSwDxrQfNtgFIQuBOhCs9yJ72A2zk0ePfnmtoYyi8iIHbL2vCAN7CWGLXh3HHBF7hPFLsc+ljVJIqAXbJdokk5xe9YFOXTf4XBmYu6o4sYxjEWa9jve545rWzYsPZh0pru7Yc6SL2ZVxCXBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638917; c=relaxed/simple;
	bh=pgNx2sdENX2tGay1fmIECFu/j3ax4mCzVXRE8j5WKxU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fr3QBINVVvVz353bWwujoifTIJ6bUbXHC5noCx96RCmsk+6lATz7ZhiqldgAuQEDi6IHjAnuadfgGoVyvhl3gJV7R7vjVbaEr5+a18vWYAHNNPSpVUBEjzUtLg9tmTQsipIMvLRNnjcsdZ5g6aSnnxRGkDMHyX9vg3gpj1QBxDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de; spf=fail smtp.mailfrom=helmholz.de; dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b=OSjUkqt9; arc=none smtp.client-ip=188.40.28.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=helmholz.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helmholz.de
	; s=default2501; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ECoGTVyrfDzehLrz8EMEF8qTYvNgxk0rK5zEaP9773M=; b=OSjUkqt9YejcixAqdz7AIYXVv3
	yHG/gFtVEV5W1gB+VKs77qsrFhoXOf0df0G5cll7oTa093/8etkoEPXk7ZVZUSCv8C+VF42diTng3
	EXyE/ukFo87GDSvtVnKo0wlKCYByE3yY9Nvjfdjk44LnKPSEcHPL2ITDOIhgCkqmXAD61B/8wnp9q
	NrKuEjUIDsNBH8RTw+A+r0gVCXYzybL3BBCMrTj56u3nt/iLd4xCS9qFRtaPTNXncCNO9fSYdh210
	6CCq7DJ7pY2sjr7ISJ/LE0XYORy8CltwcMItRg43egrkBtTWlXnfB5rKmqvCbFVrkrzUqMeD34dyr
	msOIB4qw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www253.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsP-0008n7-04;
	Mon, 14 Apr 2025 15:29:29 +0200
Received: from [217.6.86.34] (helo=linuxdev.helmholz.local)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsO-000Eer-1v;
	Mon, 14 Apr 2025 15:29:28 +0200
From: Ante Knezic <ante.knezic@helmholz.de>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	knezic@helmholz.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/3] Add support for WL-ICLEDs from Wurth Elektronik
Date: Mon, 14 Apr 2025 15:28:48 +0200
Message-Id: <cover.1744636666.git.knezic@helmholz.com>
X-Mailer: git-send-email 2.11.0
X-Authenticated-Sender: knezic@helmholz.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27608/Mon Apr 14 10:34:28 2025)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

From: Ante Knezic <knezic@helmholz.com>

This patch adds support for WL-ICLED series of RGB Leds. These LEDs
are equipped with integrated controller and can be daisy chained to
arbitrary number of units. The MCU communicates with the first LED
in series via SPI. Interface can be regular SPI protocol or single
line only (MOSI connection only) depending on the model.

Ante Knezic (3):
  Documentation: leds: Add docs for Wurth Elektronik WL-ICLED
  dt-bindings: leds: add binding for WL-ICLED
  leds: add WL-ICLED SPI driver

 .../bindings/leds/leds-wl-icled.yaml          |  88 ++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-wl-icled.rst          |  69 +++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-wl-icled.c                  | 406 ++++++++++++++++++
 6 files changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
 create mode 100644 Documentation/leds/leds-wl-icled.rst
 create mode 100644 drivers/leds/leds-wl-icled.c

-- 
2.48.1


