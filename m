Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07556311DD0
	for <lists+linux-leds@lfdr.de>; Sat,  6 Feb 2021 15:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhBFOju (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Feb 2021 09:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhBFOjU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Feb 2021 09:39:20 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B30C06174A
        for <linux-leds@vger.kernel.org>; Sat,  6 Feb 2021 06:39:05 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id o12so9823297ote.12
        for <linux-leds@vger.kernel.org>; Sat, 06 Feb 2021 06:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=Vj4BmM6o6iFFMXzT02fxNQ1KjcG0h+vrELKpUrb4lnPgIb1CBH7Czx7u5zt9Gt1p1U
         kO7wwMKmXH3jPXkXqd0uk5YwsfDqWwbwvRXcIhzGyZz7niQL/Lvb6RqoEPk6FD6LZwXo
         6L01ciWHkk8hO72MP+E+Qm7p69w6EzeGSiSnTA9MHL9oOy6Srm7jkwWXHK4/XSBBYT/p
         Rqed5YE5ssiHux8cl4iD1cd6Hcn+a+fuvlQWElINY23UkdQFJ7hsUjlAsIXVE7J+J6j2
         8UsRRHz0b7VlpJazZU2nNsVMCG18EbzZMEkBU5V5jA22UureFhTeyuZl6ElqtRTcaiqi
         3KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=nZEHmSWt4FKReEIcDCbk9H0ZKk+JYeEBaO8EJg8BSNglRpOKa7V65mrvoZZYjx3WCU
         kyflWd+UCak0a8EtPJZsX/Bjxdj3+ZuUnX502AjgToLu7eMFHxfSjMVbnf+TSg7wUiIh
         GFE9tYtBhkhWFIe2xhPm+mv0vLRiZKkM2ZVEC04i1ry8spkKRLjpY9emnLYVt1swEGNX
         vhrJtrsYwI2P64KmmYJczvvRIC5tnFrvnVaqzgcoL6+jzvz6ow7pmH7YP6xwbTp3AaoR
         rGdkmAtw+U6H9xHHFmZxFNxmEDRhP+pBUpBfk9Nu719NI4gBre1o5I8FqAHcIkcQVxr3
         uZPg==
X-Gm-Message-State: AOAM530Q2tspVxSo15ZGhr5/dB3ZS5ayEalEfzlcZMp1SaJjnmIT5Xcu
        bQ0joutHH/UNq/kjutFIWH1+nt5QTaWTCELhxXj2O7By
X-Google-Smtp-Source: ABdhPJxHrrEPcBlP/9DeHZdhoML5dQGATQWAtZae9vhWdaLAnBoy34rfe5rPI2dduP7+EkfQS/5JDKhw2qXpPE7jzPc=
X-Received: by 2002:a9d:6056:: with SMTP id v22mr7042806otj.266.1612622344888;
 Sat, 06 Feb 2021 06:39:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:3e4c:0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:39:04 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada@gmail.com>
Date:   Sat, 6 Feb 2021 15:39:04 +0100
Message-ID: <CAO_fDi9V9es6zXy1BpBSps-vhjyquNPH20Q993Hbn1WP46T9qw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
