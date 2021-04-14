Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6941A35F324
	for <lists+linux-leds@lfdr.de>; Wed, 14 Apr 2021 14:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350666AbhDNMHF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Apr 2021 08:07:05 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:48702 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhDNMHE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Apr 2021 08:07:04 -0400
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Apr 2021 08:07:04 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1618401100; x=1620993100;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JMwlqwUAz63cj+1rHJeDEtWZ7SyZOoO9BlhNY7PZl2o=;
        b=hsU623hnvAXAFiQlZF0e+2Kk4a2UKGuCYBoIf7gInEEU7j64Fa3kFCiF1gASAt5E
        yP0bl9Ftn6m2Zm2wTWsI8C9Ybouw9Lg1tR8qBOTNrbfqCxjLxcfDWRtNf11yRaLg
        iI4ymTM6pr29T/GnbU+WAc3+a61YQ6tbx0kk27q17RI=;
X-AuditID: c39127d2-324b870000001c53-a7-6076d74c0a07
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id EB.B3.07251.C47D6706; Wed, 14 Apr 2021 13:51:40 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021041413513958-114650 ;
          Wed, 14 Apr 2021 13:51:39 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] leds: pca9532: Assign gpio base dynamically
Date:   Wed, 14 Apr 2021 13:51:24 +0200
Message-Id: <20210414115124.91416-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.04.2021 13:51:39,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.04.2021 13:51:40
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42JZI8DApetzvSzBYMY0DovLu+awWWx9s47R
        4u6po2wWJzdcYnNg8Tj8dSGLx4rV39k9Pm+SC2CO4rJJSc3JLEst0rdL4MrY07eYtWA6e8X3
        jgusDYz9bF2MnBwSAiYSR49vZO1i5OIQEtjGKLFr9mJGCOcao8Sjp/2MIFVsAkYSC6Y1MoHY
        IgKOEqufHwWLMwtkSWw4cYyli5GDQ1jARqLtchJImEVAVaLvUQsTSJgXKPy8OQ5il7zEzEvf
        2UFsXgFBiZMzn7CArJIQuMIocXTzFGaIIiGJ04vPMkOM15ZYtvA18wRGvllIemYhSS1gZFrF
        KJSbmZydWpSZrVeQUVmSmqyXkrqJERhkhyeqX9rB2DfH4xAjEwfjIUYJDmYlEV63KSUJQrwp
        iZVVqUX58UWlOanFhxilOViUxHk38JaECQmkJ5akZqemFqQWwWSZODilGhjbP++rcZpQMz3J
        /8uZFm3/V02G/03/9e87ZXBYtmOe/rbm8/cd91+Ms3v8/vUzBrGnKwsFErdeFZq9eMtD1YMp
        pvN/Wb2SUb0+4W6TqIWellyFWWxkn7eu59Ee/ut5H0XdppjYRLI7rpv1PzeK5dg6HTPW7Vbb
        gjWOxkVXnS2dqva/WfpApIwSS3FGoqEWc1FxIgDAvp2+IAIAAA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When using devicetree, gpio=5Fbase holds its initial zero value which can
lead to a rejection if another gpio controller already occupies this
base. To prevent that collision let the gpio base be assigned dynamically.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/leds/leds-pca9532.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 27d027165472..017794bb87ae 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -480,6 +480,8 @@ pca9532=5Fof=5Fpopulate=5Fpdata(struct device *dev, str=
uct device=5Fnode *np)
 	if (!pdata)
 		return ERR=5FPTR(-ENOMEM);
=20
+	pdata->gpio=5Fbase =3D -1;
+
 	of=5Fproperty=5Fread=5Fu8=5Farray(np, "nxp,pwm", &pdata->pwm[0],
 				  ARRAY=5FSIZE(pdata->pwm));
 	of=5Fproperty=5Fread=5Fu8=5Farray(np, "nxp,psc", &pdata->psc[0],
--=20
2.25.1

