Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD435B272
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 02:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfGAA2b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Jun 2019 20:28:31 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:46491 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGAA2a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Jun 2019 20:28:30 -0400
Received: by mail-qk1-f171.google.com with SMTP id x18so9666617qkn.13;
        Sun, 30 Jun 2019 17:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7qYFyTa++dPYcTB/wPOOwVksoths7n3J/hGDQEqBk9Y=;
        b=bPXYpNuRbzysSa/8pQCMk6dwAcL9Rtn+30GYHuF+swMnoy5/1OZjhO3+YEJF4yiLiJ
         dRO6CwvPWIcEUAISJnt5OmmrTt1sR+mHIVck4aKRa0Jmc7yXUX6hwNbOBjSrn60yCSE+
         fp+sf/xnjLOSE+KTH4ZZLmZyfC5hAIYP/VNyOJGu1KcB6OZMUkCCbwkixfQuyrOBojm2
         Bn1rSadoFV/D3ufymRmWCdA0dYC7d/y/u4Dl6OlMzx+GXFuajZ8CteB04fXipQlYHkGt
         qqvkgxAn4Nc76faUjYWMvInhnnYEiPh5cxRQkJsg9PuP2+63mUjtkNAjhJHYCkMRkQVm
         IGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7qYFyTa++dPYcTB/wPOOwVksoths7n3J/hGDQEqBk9Y=;
        b=j83y9GZuLJxkDKGfGVNivNQXdbVlushGEIn/0f8D58DKn29mgeCtE0AwaaPdynXZE7
         1xz+Yv9yMKN3hbQpvLkixQqmhUMmN7Bd0twnf+9quP8ASf+k89nCs5jil7hKbaED3qmV
         H1oTAInJ5G1PuM1h+6UmgIGLNtOZgNxxL/N7FnbI6cfMMx/d9INCvDD3xsaxGN6L8mXN
         W7d1XhK4B5Roh5peIWCpGEC+TLo8LReP9It+5Xf+v9G2WdlpB60ASeEIUy5NoSISCCgp
         IIGsmrHmJZ+Qzg8/z+Y2BI4qDRWjH4WzmbjpgiRlogSHhSGkxz33C0aphy2NraDZ4kY7
         aXAg==
X-Gm-Message-State: APjAAAVIBxkfSFH0swbUpC2iZELXdoD0cTcGQyRaJMtLAflmKgUXEV0P
        zNMnZNI3EeuzD+SJJIShtXc=
X-Google-Smtp-Source: APXvYqzYYg9GzCKY0A+FyNahVdDjis8vR4irKL7u8oE3utcfTC+p0obqxkqpQ/Hs/TZEqdYpGLNMew==
X-Received: by 2002:a05:620a:124c:: with SMTP id a12mr17969302qkl.336.1561940909759;
        Sun, 30 Jun 2019 17:28:29 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id 70sm3971404qkj.118.2019.06.30.17.28.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 30 Jun 2019 17:28:28 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: [PATCH v2 0/2] fix vendor prefix for arcxcnn driver and bindings
Date:   Sun, 30 Jun 2019 20:28:13 -0400
Message-Id: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

These v2 patches incorporate the following changes

1/2 dt-bindings: backlight:

The documentation for "arc" has been re-added but marked (deprecated)
to match the actual driver support for that

2/2 backlight: arcxcnn:

Added new-lines and fixed spelling as per feedback

Original patch description:

This patch is to update the arcxcnn backlight driver to use the
proper "arctic" vendor-prefix and document that in the device-
tree bindings.

There is at least one existing device using the old "arc"
vendor-prefix (Samsung Chromebook Plus), so support for that
remains in the driver source.

