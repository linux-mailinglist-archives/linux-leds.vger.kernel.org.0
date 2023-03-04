Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072FF6AA88E
	for <lists+linux-leds@lfdr.de>; Sat,  4 Mar 2023 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjCDHbS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Mar 2023 02:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDHbR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Mar 2023 02:31:17 -0500
X-Greylist: delayed 365 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Mar 2023 23:31:17 PST
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAC81ABFD
        for <linux-leds@vger.kernel.org>; Fri,  3 Mar 2023 23:31:16 -0800 (PST)
Received: from [IPV6:2001:1488:fffe:6:ffff:ffff:ffff:14] (unknown [IPv6:2001:1488:fffe:6:ffff:ffff:ffff:14])
        by mail.nic.cz (Postfix) with ESMTPSA id A96A01C116F;
        Sat,  4 Mar 2023 08:25:07 +0100 (CET)
Authentication-Results: mail.nic.cz;
        auth=pass smtp.auth=josef.schlehofer@nic.cz smtp.mailfrom=josef.schlehofer@nic.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1677914707; bh=LAk1MfoQTyK+I8wozVor6jQ1oMyE8aQLE/7twd7XBIs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Reply-To:
         Subject:To:Cc;
        b=rChTpd2EkhcSsP1K2Gs3YElyd4aRU85lJ0R6rbiGV73v66jrYe2p+j/Y3LZn6UEHQ
         1sSeYsqOMelL2Ckop1cpmr13FTkHiz4+7kvXO0DiSnykuI+HZSkXzHtl99saJiZM+z
         petDIcM9cxMOmtcN5/Uc1f3VbsDdz7NprrbzH/AY=
Message-ID: <c11ef431-e297-3606-98e9-5c13c4295cf3@nic.cz>
Date:   Sat, 4 Mar 2023 08:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] leds: turris-omnia: updates
Content-Language: en-US
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20220704105955.15474-1-kabel@kernel.org>
 <20221102002311.twso5wb4tzba5h2k@pali>
From:   Josef Schlehofer <josef.schlehofer@nic.cz>
In-Reply-To: <20221102002311.twso5wb4tzba5h2k@pali>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8ABMjPfT3KOdMAfBOQLs6Q0l"
X-Virus-Scanned: clamav-milter 0.103.7 at mail
X-Virus-Status: Clean
X-Spamd-Result: default: False [-0.20 / 20.00];
        MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
        ARC_NA(0.00)[];
        FROM_EQ_ENVFROM(0.00)[];
        MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
        HAS_ATTACHMENT(0.00)[];
        WHITELISTED_IP(0.00)[2001:1488:fffe:6:ffff:ffff:ffff:14];
        FROM_HAS_DN(0.00)[];
        ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ]
X-Rspamd-Action: no action
X-Rspamd-Server: mail
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Rspamd-Pre-Result: action=no action;
        module=multimap;
        Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: A96A01C116F
X-Spamd-Bar: /
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8ABMjPfT3KOdMAfBOQLs6Q0l
Content-Type: multipart/mixed; boundary="------------ST9Vn5E5Iaei9r0QF7Yrqax5";
 protected-headers="v1"
From: Josef Schlehofer <josef.schlehofer@nic.cz>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Message-ID: <c11ef431-e297-3606-98e9-5c13c4295cf3@nic.cz>
Subject: Re: [PATCH 0/3] leds: turris-omnia: updates
References: <20220704105955.15474-1-kabel@kernel.org>
 <20221102002311.twso5wb4tzba5h2k@pali>
In-Reply-To: <20221102002311.twso5wb4tzba5h2k@pali>

--------------ST9Vn5E5Iaei9r0QF7Yrqax5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QSBraW5kIHJlbWluZGVyIGhlcmUuDQoNCk9uIDAyLiAxMS4gMjIgMToyMywgUGFsaSBSb2jD
oXIgd3JvdGU6DQo+IFBpbmc/IEdlbnRsZSByZW1pbmRlci4NCj4NCj4gT24gTW9uZGF5IDA0
IEp1bHkgMjAyMiAxMjo1OTo1MiBNYXJlayBCZWjDum4gd3JvdGU6DQo+PiBIZWxsbyBQYXZl
bCwNCj4+DQo+PiB0aGUgdXBzdHJlYW0gbGVkcy10dXJyaXMtb21uaWEgZHJpdmVyIGlzIGRp
c2FibGVkIGluIHVwc3RyZWFtIE9tbmlhDQo+PiBkZXZpY2UtdHJlZSBhbmQgaXNuJ3QgdXNl
ZCBieSBUdXJyaXNPUyBiZWNhdXNlIGl0IGRvZXMgbm90IHN1cHBvcnQNCj4+IGVuYWJsaW5n
IEhXIGNvbnRyb2wuIFRoaXMgaXMgYmVjYXVzZSBJIHdhbnRlZCB0byBpbXBsZW1lbnQgaXQg
dmlhDQo+PiBuZXRkZXYgdHJpZ2dlciB0cmFuc3BhcmVudCBvZmZsb2FkaW5nLCBidXQgSSBz
dGlsbCB3YXNuJ3QgYWJsZSB0bw0KPj4gaW1wbGVtZW50IHRoaXMgc2F0aXNmYWN0b3JpbHkg
KGFuZCB0cnV0aGZ1bGx5IGhhdmVuJ3QgaGFkIG11Y2ggdGltZQ0KPj4gdG8gbG9vayBpbnRv
IHRoaXMgZm9yIGFsbW9zdCBoYWxmIGEgeWVhciBub3cpLg0KPj4NCj4+IExldCdzIGltcGxl
bWVudCB0aGlzIGluIHRoZSBtZWFudGltZSB2aWEgdGhlIHByaXZhdGUgdHJpZ2dlcg0KPj4g
bWVjaGFuaXNtIHRoYXQgd2UgYWRkZWQgdHdvIHllYXJzIGFnby4NCj4+DQo+PiBJbiB0aGUg
ZnV0dXJlIGlmIG5ldGRldiBvZmZsb2FkaW5nIGdldHMgaW1wbGVtZW50ZWQsIHdlIGNhbiBz
dGlsbA0KPj4ga2VlcCB0aGlzIGltcGxlbWVudGF0aW9uIGlmIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IGlzIGRlc2lyZWQsIG9yDQo+PiB3ZSBjYW4ganVzdCBkcm9wIGl0Lg0KPj4NCj4+
IE1hcmVrDQo+Pg0KPj4gTWFyZWsgQmVow7puICgzKToNCj4+ICAgIGxlZHM6IHR1cnJpcy1v
bW5pYTogc3VwcG9ydCBIVyBjb250cm9sbGVkIG1vZGUgdmlhIHByaXZhdGUgdHJpZ2dlcg0K
Pj4gICAgbGVkczogdHVycmlzLW9tbmlhOiBpbml0aWFsaXplIG11bHRpLWludGVuc2l0eSB0
byBmdWxsDQo+PiAgICBsZWRzOiB0dXJyaXMtb21uaWE6IGNoYW5nZSBtYXggYnJpZ2h0bmVz
cyBmcm9tIDI1NSB0byAxDQo+Pg0KPj4gICBkcml2ZXJzL2xlZHMvS2NvbmZpZyAgICAgICAg
ICAgICB8ICAxICsNCj4+ICAgZHJpdmVycy9sZWRzL2xlZHMtdHVycmlzLW9tbmlhLmMgfCA0
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiAtLSANCj4+IDIu
MzUuMQ0KPj4NCg==

--------------ST9Vn5E5Iaei9r0QF7Yrqax5--

--------------8ABMjPfT3KOdMAfBOQLs6Q0l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEVvFq11QlPPxS8G8UcXC6Lx0Cn8sFAmQC8lMFAwAAAAAACgkQcXC6Lx0Cn8s3
9AwArDEXz0gNu+X6l4ilzjaA6UkHUUeD/YAIxqXUOUJ8ePfTUvt709ZXnzYEtNhEqqBO4NldIRDC
O3WckSiDKIRCfOHmh6L2l4u8d6h2F+KQBjwUGl4rraBzwSxH3VXem3MzFzASAiQKPbhesAARoGqR
Ybssp/e2ccWgCbgRmN7HFQDIBXRlPTRZJAmelD8gcNriiaFzb2zsxN1i6xXQX6Z7fOmtMYpaEM5f
LPs/HjcFMU9rybzU2vtFVmMMaT+4yDeafctBzQ6Z1n9RU8ew+gPyVHJy/+GRw5Gynt/wokmA2ibM
Jji5+ZjYKqlnyKCXk+4gQb85AWnldUhiwc68VQGUVXjr950FNk4Ii2MRiZAwsGXGqljI2KcDgFBj
UJ0Y+ZnNegNsRMhug+sGo5/CpRi4NxzVU3ZKj/LczkkvOhXVOJ6trwtShcdpQlZxeJyT5NEF6h8G
Px3OXoihkUkTzv7rUXjKamrCk8MIqHooGPibwiUrLVCT7y9v2Hs7kiexb7BA
=ez3L
-----END PGP SIGNATURE-----

--------------8ABMjPfT3KOdMAfBOQLs6Q0l--
