Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 893357E1714
	for <lists+linux-leds@lfdr.de>; Sun,  5 Nov 2023 23:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjKEWAF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Nov 2023 17:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjKEWAE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Nov 2023 17:00:04 -0500
X-Greylist: delayed 5202 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:00 PST
Received: from SMTP-HCRC-200.brggroup.vn (mail.hcrc.vn [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE191FB;
        Sun,  5 Nov 2023 14:00:00 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 14EBC18FDE;
        Mon,  6 Nov 2023 01:57:39 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 0DD9D1907B;
        Mon,  6 Nov 2023 01:57:39 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 9FBD91B8250B;
        Mon,  6 Nov 2023 01:57:40 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id yBwndbhx4GbS; Mon,  6 Nov 2023 01:57:40 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 6EFF71B8250F;
        Mon,  6 Nov 2023 01:57:40 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 6EFF71B8250F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210660;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=kAPSiTcfELOHods7+bsGCgYd8nO07M/mOwUtdU0d4qzyKjc16EkYrgTPtHPcmTU7y
         XgzVpUCoMtkT2U86Qk4N4C0fQ4+SbpFEu2FXO/j9JWefBSVP64qnZmg7wqHGlSENAg
         DB9LHskp4fzFnPs92/aVpHJolkZzGFFJWk4Cz6MRQxAu75SjMOdGFElozH44mIQ1yk
         zJ3fV9YpuHzWebAg5rq4nenJ9TKscld+elNrgZX0KUwA8W40XIQs9hyvvdPtAbeK/n
         YbX2HWr7o23Ew4ZB1iv1FLe4BX+5UxonMBaUjaiEHJ+abUITS22bJ909PYPJx05Djl
         jzTXJpusjo5og==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BTk4ANiSyjCR; Mon,  6 Nov 2023 01:57:40 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 302521B8250B;
        Mon,  6 Nov 2023 01:57:33 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:23 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185734.302521B8250B@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

