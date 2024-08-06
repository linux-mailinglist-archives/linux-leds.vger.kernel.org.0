Return-Path: <linux-leds+bounces-2410-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4923949991
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 22:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DFEAB27D4A
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 20:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5DE158DD8;
	Tue,  6 Aug 2024 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEHIKsWT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EF9155CAD;
	Tue,  6 Aug 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722977426; cv=none; b=oIKxqGPGPynEfCo5r9P4x5JtzU+UluvOJcwx1ZAxSvHqq0mGmsgs5PMfOhNDqXJl+ZKzf53SRgi2MqGIny7wpjJKFnqLIZ55G+3xTqFxfUi8MYkZFGteu2BWb65Rs0Ot6xckjiWnIV4DH4uhUAlV2GiZL4JWaR83bPgo9f4u6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722977426; c=relaxed/simple;
	bh=/vIo88rGxJ7Qi1zU5jtv8+n+vDDff7LpbagHpBmGLkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o+KBpTnHctsA2f+vgUzyhrlqQq5DMOtFZJChdgpNbQpkk5DVodFd98wBXbTDGU1s+yiC8Uob5BWmdZaMJ/0n345KlnrcQqrSCaXkX7483EuVcGUFUO7nW5OmJJ9WH7f8Krq+FZTTaULfLdO8IM2FY2jNZ5hIeEM4QuAQ2wHzpTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEHIKsWT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so113364966b.1;
        Tue, 06 Aug 2024 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722977423; x=1723582223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPWAqHyClCkz14eOqbyrR1m/H7AsRzTMOO2Sv00fuaA=;
        b=TEHIKsWTxbxpiQLHCkuWnG/MCAj0nfTmURnML607pHIhdSst22cS8DOHyQ+938FFKz
         4hZl9Q/ILhDLX+pxEuaJA+ytO15NsT5HlHlgrnwhpXTiMn/Mzp8z1S48IMOUlPWzBVE8
         YDrQPCXy5yv5/MlN6ZO2MxTMhRHhNchFF+yQ3hdqaA/53AaxVSuaabSZLq0LW6mPHf60
         qxoATJPLwkLJw5DszihF+JsYljAgfwJz7j4nDagNY2ceBRjPg/R9LxOyNOB1/BKeZNx+
         evFjWmVTNbhLuFr0xwXSM32klELv19Eo/eiFnsnLCHN8/jO/wPntEiaShzX+TKU6yljj
         ImCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722977423; x=1723582223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPWAqHyClCkz14eOqbyrR1m/H7AsRzTMOO2Sv00fuaA=;
        b=uXF9DiPYWKKN7j63C8mbJPT/+6ouaabiU/n29rrlK3WP6ZEo3gmVX8+wEY6eh64Aiq
         FgNFDI7ZQKk/o7WIba6Z8FIXJi0hxiLNG58R00z1BCEXU7ZLgQIGuEk6+ck6YnPkGeSa
         SOkKqnBLwzdHLw2T35OZboPRZuNCXCeNw+jPDyTtPr+hD55BNQBS0NvEm9RoFx9vAQUs
         TKXSf+uL3LXL1EruHvFKAFT061m6zUGKERV3lqq+2C5XHA5+Kzq+kmnVmuLoWs8ZihOO
         B4qqp4uDoFJMpOWUxaqpxYi4/LJcNfrP9muFnlUy+9USoNX6L14cLX93f4eF5IakSohi
         Kh3A==
X-Forwarded-Encrypted: i=1; AJvYcCV3Db9yEvshhJFpZLjeLKpA+Bsr0xVlx+qY4eCgR8/pEa4dRnXnjdUT2MghXjVzz0s6Gkq6mXK/RqiVb21lNzzehHze7Y5k5DUwRHvOoSlmsNagA99S2iDEu4b4x6J6t3dn0dD1AttFQ7xPonBMs9lfwnTrO/HpPUkyvTqU4Nk0a7uqyl9tdW2LRcMMW6kqoSnEdbYDsvsrpYzwKGXwF+OKwUNMDTdAy7H4mw==
X-Gm-Message-State: AOJu0YxbkoBRP22zPnEtw1thGtoYcFR0CGqbPIQjGnF/EXmBUXMY2XQr
	9pT/xVnND/38kKyEIfaLL9prknrCpOx2NMrah+brke3OUo6JeyQn
X-Google-Smtp-Source: AGHT+IEK7snqhGEt0KxcB2YfnB10pN1hdWKFMMtgDeoUtWdZlsGgynYkA8Nr/UcGh8tdKonEa33RpQ==
X-Received: by 2002:a17:907:7e9c:b0:a72:6b08:ab24 with SMTP id a640c23a62f3a-a7dc4dc4df4mr1018771666b.14.1722977422271;
        Tue, 06 Aug 2024 13:50:22 -0700 (PDT)
Received: from localhost.localdomain ([94.120.87.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e8674dsm588730066b.146.2024.08.06.13.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:50:21 -0700 (PDT)
From: =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: mustafa.eskieksi@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	rishitbansal0@gmail.com,
	bahaku@elrant.team,
	carlosmiguelferreira.2003@gmail.com,
	alviro.iskandar@gnuweeb.org,
	ammarfaizi2@gnuweeb.org,
	bedirhan_kurt22@erdogan.edu.tr
Subject: [PATCH v7 0/1] platform/x86: Add wmi driver for Casper Excalibur laptops
Date: Tue,  6 Aug 2024 23:50:00 +0300
Message-ID: <20240806205001.191551-1-mustafa.eskieksi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
I made the changes you suggested.

On 5.08.2024 18:31, Hans de Goede wrote:
> So lets name it "casper:rgb:biaslight", which I admittedly is a bit
> weird, but backlight for LEDs which are not actually a backlight for
> displays or keys is confusing, so IMHO biaslight is best.
I agree, biaslight fits well. Do I need to add this naming to
Documentation/leds/leds-class.rst?

Thanks for reviewing.

Mustafa Ekşi (1):
  platform/x86: Add wmi driver for Casper Excalibur laptops

 MAINTAINERS                       |   6 +
 drivers/platform/x86/Kconfig      |  14 +
 drivers/platform/x86/Makefile     |   1 +
 drivers/platform/x86/casper-wmi.c | 640 ++++++++++++++++++++++++++++++
 4 files changed, 661 insertions(+)
 create mode 100644 drivers/platform/x86/casper-wmi.c

-- 
2.46.0


