Return-Path: <linux-leds+bounces-4424-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459FA7DA46
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE41188C5BA
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3FC230269;
	Mon,  7 Apr 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+p3cb4p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439484C91;
	Mon,  7 Apr 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019620; cv=none; b=guy5fyQ7umI1LBhG0to4voPIn8S+sQT4olXS8wJAQKXT62Mcmsuy5KQhd3nBUtQx3aIKm8dmWY2ZiHOfjjmhxEGvHur7mb8UH68ftJzG0EISion+Rb2qr/Z4afEg76vjWsLGixtgJ1FHA8DVWo7qCnJa834rEk6dpcSNVBYubbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019620; c=relaxed/simple;
	bh=gvs9QC6yT925MKXwR/gGX5h2XR3pThb9j06U9N1mB8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0jVket9c0YSaZB6JYIovEA8XoNobOCS37kf5OZoeIDg1d/4lfmmyxmr7RIsK/eHv6yuP5KFKTB2UK0FTX7xRWUSkW1XALzwPR+gnXqrKJ2sLaD3rgg2qK+xeMx1NCcRI6RZXurOrpywXK1McmNfgJaLNxYl/d4juSw35uVoN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+p3cb4p; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so1425591a91.1;
        Mon, 07 Apr 2025 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019618; x=1744624418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q9Wp6VrDxx2zQOy34OYdMEGfGFXEUS7MNs4xrisK+c=;
        b=g+p3cb4p6K/s1xUEV1X0IyrfdsR+qvJ2fiaxf0j+br/G1vD8zdMDE8jCUl5b9XccXH
         g5kqTLBuCrGtvucN2bhnhFCyoInBF1EMDdE2/sWb7EVAze0naITmhGpzUK+yjD6043GB
         dYo4V6TjqGpKbOb35VfHPmD0s6bCzBMgQWf+w64csYmqyPSkGePIsr7T373UndVscFft
         zPhvN86/4zVkpm2JoT7lFS06WvsSnazkCar9lt5gsp801/rZZVNFjY2CrxzTWKhfLlX7
         N8t0v6KNnh/580zpsj+D/lg7lNC27hO+KQHJ/FN67zvW6cGEFJXACVNj5mwwz5Y9C17L
         lVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019618; x=1744624418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q9Wp6VrDxx2zQOy34OYdMEGfGFXEUS7MNs4xrisK+c=;
        b=SrRkMGNYxpFw97bMnjvCYlp1t/CL4ty7QYkB/ed04JjDSKzSRIit7pqrkHtyiJuoAZ
         2Pv5nHoSqRZdw9u0R2zTnwfxJlhhf5PYhbBa+PfXh3c1h4206xGI+esuO3EY4fqfQ51J
         R+XCQOkheX5YwZR8UzbFKMNEN5Uv06eAjKC984ab2dlNjr/etigT9DjIjHpXsVf0It1u
         bj/oAArEsluKVI7a4HPYc/cHjmf3iBe7LDN/szKu/kofTky1ZtVrAgl6c8Hocgt1OVs8
         E3yZl4YZao00TJjj70xidHHh13TouvltO+fBduiFObd8EbqqwsAjv2S32YsjQRvl3UDc
         eLJg==
X-Forwarded-Encrypted: i=1; AJvYcCVTgTAx6cKDlT04TpcwRoTN0esrKbgXFRpzWwJOzHYQBblFA+qA+E3vmejEc9ST04qAO1kwJ11ItWWfRA==@vger.kernel.org, AJvYcCWOPLiY3X8JKaeYtleC0F3MddVLbTxR0ykPzoIvlOvRM2vNAn3o9MMEkZIfVEes6WF5qIncG5fXsEB9mJB/@vger.kernel.org, AJvYcCWh55CSQd8scBsxOipWXSf/vUhA59w1V0mtuZVEje9MnUcZ1UeZX/YFCvp8wnUYIeHxT/h9pUoni1/e@vger.kernel.org, AJvYcCWzXjLz9wQr3bhvN/Re665oyNEI8Bv+/oY268OgHlb/bk3nwrSo4csgM+/MknDpw0IxRIQair7fMS8D2Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbtAvPrwUgp4SODZMmGTfDywo1xBg96ud40IZ5He/A5yorfMx
	qJixwi2MldpfB4HVJzGxGQqjCzzK7Dr+RPy26Yf74ZmaBIgGdFIs
X-Gm-Gg: ASbGnctLrMGoMyBitm/wPtvYuc1aulHCg/cBvfLb6tV/bwKd7cqfSwbI0kp60wN4qX/
	PyQk2KpBOZB0w869Sx75tM9oMAhjINspEgckhZlsNVXMQ34XdS1bDwsC2k1FrMQamMWQwycM7Yz
	adCu0RIIyjZoKfx+obRuygIWxiHQhqhs5Bfa0IMntivhrCI3Lgh4Ey+PZ3eNo0ZHYVExgLEv7bm
	SHPlNPg4Ebi5sOIRpDgWxuDECZHH7ma0qAtJUa3DnRaC5+SSyRKQ6sZmHVrbFFxpTBht1sil42m
	cY54aq2vX1sDdM+TUEAWwJ9fJF89CNT03EO4SOyaVA8DrN5p6GZCOw==
X-Google-Smtp-Source: AGHT+IEClB+vbekKfxRBf/hP+3rUD6Xa6pkq1Auukmq5xl2Q3VLLviKbENQ+2DbT97tBfvtw6yt2Ww==
X-Received: by 2002:a17:90b:4ece:b0:305:2d27:7ca7 with SMTP id 98e67ed59e1d1-306a47f0fbfmr19199586a91.16.1744019618464;
        Mon, 07 Apr 2025 02:53:38 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/4] backlight: ktz8866: improve it and support slave
Date: Mon,  7 Apr 2025 17:51:15 +0800
Message-ID: <20250407095119.588920-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sending this patchset to support coming devices which are using dual
ktz8866, original driver would only handle half backlight region on
these devices, registering it twice is unreasonable,  and two devices
share the same resources(pinctrl) which is required for every single
node under recent dt-bindings, so adding new support. and improve
original driver. Details in every commit log.

Pengyu Luo (4):
  dt-bindings: backlight: kinetic,ktz8866: add ktz8866 slave compatible
  backlight: ktz8866: add slave handler
  backlight: ktz8866: improve current sinks setting
  backlight: ktz8866: add definitions to make it more readable

 .../leds/backlight/kinetic,ktz8866.yaml       | 29 +++++-
 drivers/video/backlight/ktz8866.c             | 99 ++++++++++++++++---
 2 files changed, 108 insertions(+), 20 deletions(-)

-- 
2.49.0


