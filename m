Return-Path: <linux-leds+bounces-5213-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D452EB20ADA
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 15:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358AC2A6599
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 13:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08D62192F8;
	Mon, 11 Aug 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAq/Dd1q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFABB20371E
	for <linux-leds@vger.kernel.org>; Mon, 11 Aug 2025 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920457; cv=none; b=ItgkA//6bEATleyCIrbU2CDifFT7j/DY0+rKjJW80nwyXsTDXFUMzdCZeNxrGbgweVeGCD1s2jMdJ135Zh+cJO98nb05UpZ62ehZyMtKlRqTRc8fqIjFqMDJ7pY+XOI0G90KIzw/8kHm3jMbpbY8QPIj+r9izeNn/cav0SO4n/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920457; c=relaxed/simple;
	bh=D32owlGLOdlHqubNLaI9nkgZDRqlRnVWNbolwyy8jW4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sBKkqga1IgUgBs+Bhntkh4jh2qImRIFduD5NVYImeOUef7/l+Y3QlnnTQp4O3OXZlPZmOm3ri7lFUa99It0enMm0ZrKVTNrZBfUlg4HoHF251QM+GhsuLl9/QJueCjUjKmGYoH19srvL5k2x5kfReBcpuulffkoseZpQDeOHdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAq/Dd1q; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af946c07c84so60670666b.2
        for <linux-leds@vger.kernel.org>; Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920453; x=1755525253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=LAq/Dd1qi2xQtn7ftL9p/dtNdmzDr2IxZheU5tlQswqWtwk/SU/AI15qW7jtmr5K+A
         6gvDnjCXnFmk8yqxVDX9v5bcIV9r+YEwViwWjimD/DO7QrYERMtImFULyGIkrmW2jiXG
         l7gvYZloCED6lMY3uptAMmIH6Z6ATVZZ4pbsUQDSdRvr91azAx7Ns5xTcRXmaACz12qF
         pp1h4OhFV80s8/RZrsWrwqUzMnFWo3GFguXs8GKXJbdr0JsvWuA7Fmn6P+qJtFrOCwwn
         mIHiPjkHNcx/iTkOivTK5XVDWC+EIjMMZpUiQAQfPTh59m0lfC17vw66DhZOchMVEXPC
         OALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920453; x=1755525253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=HvPUNemRKJDkYGEiw5Pb4ih1hryWRUZp8w9JEoQC0mR3B5pqk0OiRfa6YuIN26jfHz
         iS1A63R/g46zCxWbHSFiDb8jU+3LPM5CXeXHXRgzNmoOC1/1BAof1switJgY6uaNG52X
         Uea2YcaIdqZKKFBx20TRRhlNe+V6fefgk/5jRUOliSp9zLsxjzNzA9i0YaD6dwKMfUxl
         AB3v421jaoDmDSf7n/9cM1IzK/oE5AXtIB3L7CbRQVMBffaCBqRnrg9BrHhUimX1KU/Z
         k9Yp/oXH+8mPvz2D6qAmYDNs9kFytQ67PkHrdUwBjJruGQxFqGo9nnJIMzsbxrPpxKVi
         sgPg==
X-Gm-Message-State: AOJu0YxqKRQzG5tYGatxT+vIkva2ih+kU/2SpM81V+Cnr6rqdu3ryugY
	cbLLw9Fr0QX0dumCtbkP8ENcOeinNfWTkxQjXkMnC6bD6J0pJ0jmh8qRq1pvSDkfMnk=
X-Gm-Gg: ASbGncs/WL+QW3Tz3zMob5MjZAhgG2PIKvWC4OgbaZad46qEBCXdvrDTxal/2HPtUIe
	Tx+OWSTwxKLy5jTZiMnHle3ymt/LuvGpxbpfuIjgmg8A3ZCitmuD9URYIS4QPSBh+wggAy1BzQA
	dE7ItwVbiZgsia2tAelg/1t00xcGjZ/YfXIaH/+2utF+j2oxWmBJixLjOPPwfNQW7pzUy0nJyna
	V57WIyYO1W4Yu582C/S+aaayqfTmvh96Nc+0yLbN1BEInHIAq8CFfImNAeJxW5uowoBz5/mI5iX
	0mnc+o16Shv8MyzWdepvgg03HyvOwugpsDaLvCKeODAyZvysVmj0l0okkOcJ2INSkK3U+2zhK3t
	72Dz8mmQAlI3UT3HGfuK5vI3P/L+FdlIeOWX7KLugd8V7SWamDA==
X-Google-Smtp-Source: AGHT+IHeQhtn+GwAGxZiHen5xqVtV0k6a2xfnhqG8tq/SVPZOQOhdgU7YDXqOB3wSUZppQOTSjZ/QQ==
X-Received: by 2002:a17:906:c114:b0:ae0:bb1a:8c4 with SMTP id a640c23a62f3a-af9deaae559mr346505666b.1.1754920452931;
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix duplicating
 dtschema
Date: Mon, 11 Aug 2025 15:54:02 +0200
Message-Id: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr1mWgC/3WNMQvCMBCF/0q52ZNrJFacHOzqoKN0SJOzPSiJJ
 KUopf/dkN3xe4/3vRUSR+EE52qFyIskCT5DvavAjsYPjOIygyKl6agadDP24p34IaHr8XBiY4i
 0tY4gj96RX/Ipwifc20d7u0KX81HSHOK3/Cx1af8plxoJnbYNNcrYnvkyiTcx7EMcoNu27Qekh
 Yi0tQAAAA==
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D32owlGLOdlHqubNLaI9nkgZDRqlRnVWNbolwyy8jW4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYAbFp5nM0BuZDzZfSz7NhlghSfON8hIYWfU
 2/PI5axk4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AAAKCRDBN2bmhouD
 171gD/9jmTBJd9weX4PdgWSBrNoi+OhK7XHL0dkfzxWr3gPih+Y1CUjQ92GvArexs7OSIVhb4um
 uOseVt8Dbup/XMM/MGDC1PpzpV8p8XdF4UAveq0pNbCcwYY+v2XYNGxnwnL4nr2wVEz4bperF8u
 dXljljLZlxUmioRkuVKfQKFeqFOtxTReuj30Aa1L9Jg/AM2lHWl/AmseQLt3bI04m81KnQk+6ZF
 /A+5PtOtF8JDNhBb2n9HXWyKslYnHGcIyYrxP5+zENqV+23fWNdCmQVV/fWzsxtgt89k8g5H6te
 uSi9CXUxJ3l+22rW4UIfWcMXIXV+mlAU/GpP8qc5TVPjGU77+0bOFKAR0MiClggadETQk6wUk9s
 e99hsxBC137+fpYgSjm1gZhF2MIA9Rr/f1DyY6NRlpJVod55+/W7eQis1d6OwEden9HaoGSqqIR
 gKnpWi6HkStV7dKm39wIzBWqty3KqqzAoFy+kQCGtY1A7Egt0bEEsRjlmyN7o2GDRdAAEH+FWTq
 r7/nf+NA90ybfUzoI/QgozgEPiLCljf+/hRtID3Xp+1rHHpIOhUDJRb5MdW2JW2TFpgx7aRDW7e
 5TiVtDmDj+sElyEwNNXEVSzWPxAIgbI6HY1IsRvzCTgAw01ZXRmBAhjO4Rt8MGOEF1hGglmN/VS
 7xnWoAozbu5jkoA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resending because all dependencies are merged.

Please take individual patches via respective subsystems (phy, leds).

Previously:
- Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


