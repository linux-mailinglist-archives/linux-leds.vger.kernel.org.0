Return-Path: <linux-leds+bounces-4356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC711A6D368
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 04:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9B6167D0C
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 03:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558C11865E3;
	Mon, 24 Mar 2025 03:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKUVjTmU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365717C208;
	Mon, 24 Mar 2025 03:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742788502; cv=none; b=drljG/DSkfxZd7iAjJrOgSJs32Q6/radle8TkFkc+cHHw9ETVSb+U2qJdWxoa/JXFDezUNkUygeXbyUOdtLyrPDf2xyg2Yq2Jqni56ine8DDrfttSlcfEpsT0p8PP74qMzUjHkhK4Y1/KcGjOMrDWZQsDDqsVwW0r7gBv1uhV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742788502; c=relaxed/simple;
	bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iEni/fvDvugl+YzX7jEl95563EMFoF0/XuSSPmrfSXS9MjTCouMTQ1kopJtxzKYRRbL/TaBNJHaEu4bIk0jepwPVmi91oiPfLO8rhzYmSWGXF/CLGPewycpfY9A9Z3b6/mPMrEGQlV8ZSL2PDBw0+JzzakEf8BgX4NCJNE4rchU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKUVjTmU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2241053582dso47842545ad.1;
        Sun, 23 Mar 2025 20:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742788500; x=1743393300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
        b=TKUVjTmUkuVGnJp9EmWt/VSyEXl1oX4dQwQBxVT5HQa3PAHzX+DkEeoBN0Dp7y7hsP
         2+34C2wSeSwZhJrvGcPN/HswxKsJ1kF25LQhVTu9atZ2zUVIOhYiXgzae5Lt6CIOxwC3
         XHkAVrgMMNRHUnp2F3p/v9iOtFzgAPfTCMBNOJgIwZIOt3ugpdiDAV2uyVP5XRswncdF
         8botMQUXJI7Ka44NZ5pZZc4U9jjs1BYcfvINBQWvW2CYISBkesxk+Oi//2vdTQVqSoyN
         DWWQMXL6WshmQhbPDUdRayvwG4EFKr/vaQsOaUtQrlzmHEzThcZ+rqFtjy/vcU4iLjrw
         6hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742788500; x=1743393300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
        b=TUgZOPRSNFFU9+hXeZmQSwIUaKokYObSfRsNPVGbBLGw0WKFsouOpPLkTIWTn2ht65
         TMB9RD57X2pZkqHWumd9ztpuosmltV1u+S7OaPC8sdN/lPmOlSZd/9AfdnPtrLGQtYcU
         MUJ/A05u1aCLDYoiSr6SQX110eoP7EjDPXgVx2O3Zi9k9BvUr9NEI/7EQP1GMwBy+Svq
         VGUFtHCrXRaObltmUBcp6Eyjq/ZAZMITucouusFd46zUvIiFqybHJK973Z8cH8el5CqH
         Gpm/KWXMxSw5/lPZ57FVN2D87SDE/VivENDTsKk9dqPPJs+/hUqZ8doNOA1Imnpwua2v
         hA1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzBf6vGSZOBCfVoJgqE5wnAU0hVp4GbAIJZUzfAfpYTFtkn/DWNxGIYrwTDcaSF/MbQZW5zjM4iSOdew==@vger.kernel.org, AJvYcCWvVFVwqCLM83DKxf1zc85C/QtgkJzgMU6xjQt+0zRBktdfQkU0JaWTXjuUe2W97i1GIU01WZ+Hf3W8@vger.kernel.org, AJvYcCX3X3h5yH2RcAmEeSPQj4bEVpo4aaK0UD6hRyzjsrMyPl5sR9b0bnHldJXP6sk4v96KyZudU0awFqhTApwB@vger.kernel.org
X-Gm-Message-State: AOJu0YxaoQLtWQMpsJXhvNcj3WOBtiwwpVGbuWNzmlPFguQOOJ5tk78y
	deuBd+VO04RMAlPHghU4AgZHINX4gQDiiJCbvZqnNRK6qFWeo0LOxlFDXmk4
X-Gm-Gg: ASbGncvoc/eLafPlOijtjrdXcjCgGeAbBVlhhOFs1DW8CJU2etyg3f8rorlkNEfvBnb
	YYM5C8xk0uQQi9WZ++ONL1709Z1yleLOeOYtqT/x7HDSmSO0WKzzB4uT5D6OjSeqqfBiMKK+dWd
	Hov1o7eR0O+V5aW9n94Zr/emDGTJSbkKP65ddAegR67crl/Ugo1mgd5cQIUbApPWd/TwWlU6crh
	mEhEB6tzrJXwlq0E6E3ApKfMetvR2Gin0rR12++r4Zh+ufW9yYX7vPBu8NRgJ6TiwY9zq2f3l64
	65g2Es3KtSvjtx7Ml8lRoZE79JYsxjKY1tyIYhzUbb05E14eqsnBx7gMHA==
X-Google-Smtp-Source: AGHT+IFWy74ALLhpZhrC/pz5YWeYoMXbdSt8CkZAKJYT9ZUmmymrOJLKxsJID5oJoZylnj0+k2m53g==
X-Received: by 2002:a17:902:ce0e:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22780dbff86mr170040045ad.30.1742788499810;
        Sun, 23 Mar 2025 20:54:59 -0700 (PDT)
Received: from localhost.localdomain ([27.70.184.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b242sm60167265ad.41.2025.03.23.20.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 20:54:59 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Date: Mon, 24 Mar 2025 10:54:32 +0700
Message-Id: <20250324035432.6855-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0250320155012.GT3890718@google.com>
References: <0250320155012.GT3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your suggestion. I appreciate your guidance on proper email formatting.
I will ensure my future responses follow this standard.
Your feedback is very helpful for me to improve my contributions.

Best regards,
Nam Tran

