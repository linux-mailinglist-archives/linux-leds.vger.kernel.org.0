Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2242C529F6A
	for <lists+linux-leds@lfdr.de>; Tue, 17 May 2022 12:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344208AbiEQK3h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 May 2022 06:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344202AbiEQK3f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 May 2022 06:29:35 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70134.outbound.protection.outlook.com [40.107.7.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41B8C1
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 03:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+JddZyyvhSF52wD7SJFp8xGqD4NwBHqMSaaxulcDNGoBa5t/jH/+3nHaQ5qbIFcizQrQtRW7gSux3/2EAB6qz3CtFneP7i1ly6OMKf7jb9Ni8Tnioxs1yrM49U+dgih6crjBBP60LpW32T2ZFZaWWHr6ZaakvZYHAJ1LEemwluUv/TIJ+tkrUDZOcr442YsfMZLPVBLNn/jDUhF5H6C8D3sbgvIv7VY6UUGLRA030cy9JZ9X5HLee1BZ6u8Xh6RPCNNrTmPERGMFpReObtUlURgpZhpAjAYZDqtI3TeOY3BQ98u00itQMWNxFhTIXWCDGiKhze1AZiQk25QhZdUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0mL/tY1Z5Qf/UhZU3rL58aPIXcN7RiBLfmQnndVhRk=;
 b=nmB2BYvps0KIb/jWmKGsywpryDJFHJn4pHLiENVw2RiVfkABaHqtvAfKFQ9qdmwLLZCMXcX/WkLHeYIEsRBktsLjfdXj8OZiwpnifX/Iw+z8Yvh1eLqLcOGyfsVr0I8iyzh80f/0rV9Tm1a/U4zp9CeFjCrwQGgXyg43Q6YkBYftHG68uz1RcaqT6yTFysW2BDnPghT68pi1wbNITFJ/rpJbynCUHmkvzRzTiliblBRRUc4qir9GfqRtCIXejJ6B6lZYQucQ/PFZU1JGFZ/glFKel0WDCRxzwPQ2Z+hOCxtj1CbfV/a60ki5njV2+gR+1RvvSRTbh3wM9JqYjlnIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0mL/tY1Z5Qf/UhZU3rL58aPIXcN7RiBLfmQnndVhRk=;
 b=kw6KrqkI16XUFnT7nSL8EerHr4pTwHr/32/vbjX/f2WcSGAsF9FgbKxLkdqNVRnMov8greRgjq8NAEwB/v7xp4n0GQloZy6iH3Bskg9+De0673kNCRJPvaTcO8belSHL8yagVg94kypmrZqb7kKdXPYe/B6fBLhcBCIrBf+d0oU=
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:6c::18)
 by DU0P190MB1802.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 10:29:30 +0000
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac]) by GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 10:29:30 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Sven Schwermer <sven@svenschwermer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     "pavel@ucw.cz" <pavel@ucw.cz>
Subject: AW: Setting multi-color intensities stops software blink
Thread-Topic: Setting multi-color intensities stops software blink
Thread-Index: AQHYXuekOzujNo6dxUmEYP7zmCG9Oq0i7Juw
Date:   Tue, 17 May 2022 10:29:30 +0000
Message-ID: <GVXP190MB19172D8DD26648FC9F2EB4D6D9CE9@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
References: <4e88850e-9e45-2b47-c857-7070ec87440f@svenschwermer.de>
In-Reply-To: <4e88850e-9e45-2b47-c857-7070ec87440f@svenschwermer.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schleissheimer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a03e86e6-a080-44aa-691b-08da37f02074
x-ms-traffictypediagnostic: DU0P190MB1802:EE_
x-microsoft-antispam-prvs: <DU0P190MB1802891DC8EB35929AB4F573D9CE9@DU0P190MB1802.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z9gYJFzYS95YuHYcNd6DQCIs6lIfSGMs2QCepEramGJt1hDSj1z96kYEEpVV6KcXR3Nrtee9i/AvusJVfS+Ys0Kr3RvefBnHclNkfOlzsup2H9egwgsVg302KdLXV4v67VcuUe6sHq1zaUHwmutlfy6Mj7FOIDP8xOO+uAX97wCvjXWufSLXSzKSOFHDg89eT1dwlm4whHNF1ptLAmfjbJFesmqUXL91glD0c6co7Zj3cQKxZrTcQCoD1sq05IY5DcPNyon1CaY/gbMwIdShTBlCqJPD19yEibw1F25O88FrBQO+IG3aBHCtFP1lc2gAiJbDRpCFtXl/S2mJa98enTGmAGfNXotGyCBl8hOisAOQvSx6hsXYyNzcE32BjfPB5zDo0Vvgj8DHeqsTYshvyi4b/VX7vUqhAeyhlhruT0EUSXEpvwxlgQ+5tgmlIKUWu4KkLBY3KfR/LyeeMqacuIz3LL6ZNh4soAK4TXC4Y/hvLKFTSJFHTTSj/3Io8BhIdZndsY80qdUZn+28f/gxA08BAJ0EohzdI+F0vP05OMhRhlkeEcilZ96puJ5xIHfNgM+viWzCdB0FbpnFh8TM2AVPILGbhwdaPxsr95P3iMh7rO5eiGOXDtEEljc5p21ajZSB3n7kWFjscRJfhHODw7N5yMJRolUIHfN+9TkYMSPbuZOShNGc+vzcF8TlYA90trCC4jug1fBcfPRCTjdW7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP190MB1917.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(376002)(346002)(366004)(396003)(39840400004)(136003)(7696005)(64756008)(8676002)(6506007)(9686003)(76116006)(66946007)(86362001)(71200400001)(66556008)(316002)(508600001)(38100700002)(186003)(122000001)(38070700005)(8936002)(52536014)(110136005)(66446008)(66476007)(26005)(41300700001)(2906002)(33656002)(4326008)(5660300002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWtuSkR2Tk1uQlpXVWNQWVYrd2RETmRrSGRWSmhEdnFvdWxoZ0NZckZrSnl4?=
 =?utf-8?B?eWNZa0NoaUY3UTBYRlNaQW1waUxjemZZTmlZNHMyc0EwNE0yZDFlRmJxRVhi?=
 =?utf-8?B?SFpyUXBhWUJHTk1MYTBCUEx2d1diYmN5K1pSWDNaNURUWSszbjdpMnNZd25v?=
 =?utf-8?B?eUZSM2dHWTJRaDlnWUtyT2FnQzNXU040eURXUjRlUFpwK1JlSEgvYTI1NFhT?=
 =?utf-8?B?WXpxTXYrbHpybC9vSEVBRUlUZjFlcHRDaDhGWmhxb3V1TTZPN0FFVk12R3pR?=
 =?utf-8?B?MGhMZkpQaHRUUFMxNlBZN0Y1ZWt6TG50MVNnYzlsSEVnYTNzVFA1UHNhT1pD?=
 =?utf-8?B?c1JQaUxIUkY3NGgxcy9jQXZwbG9vZFdLL0QrNWxQY2RBSTBCNDFRU1gxc2xn?=
 =?utf-8?B?MDYybmRNRXhza2lwb0tuTUxLNHNUQjJmNmRaQllRYVR5WEt4a1FXc0Rxb2lI?=
 =?utf-8?B?cUdDUkV6NEk1WUR5OFNKTVN4NG44MWt0b1lKUkRhbjJ0YjFKM0Jmek1JMTVl?=
 =?utf-8?B?MlBIZkoramIybHVKemxHbmVnSFhJWk1qUlRiUDZUWkRVWnlacXUyNVdVQmpM?=
 =?utf-8?B?MUZLU2wxcnIwR2dKL1EzWUV0aElKMS9NcmJCeXlab1dVeGxsT1h3ZXU4RGJO?=
 =?utf-8?B?cnJoYnlFYVpGeEdVaHNVRDdHN3pUWTErKzdaZ0pjbVZOeElIeEMreFlDWVAw?=
 =?utf-8?B?MDZqK2xGYlh1ckFTMTkybUJDT2NRU3Q4eTBwZnV5dm83Rk55NGMyZXAycFFT?=
 =?utf-8?B?ZitmclZLY1QvQm9zbUZhMFl6aUNEYkx6ZjM1bWNsaGpSMnF3OUhGb2Q0TW1a?=
 =?utf-8?B?bXhPMmZMV1hYaXljSFF3T0FMd0h4SFNwMEV0aDNKTTlDRTZ1Smx3U1V6QVZi?=
 =?utf-8?B?SDdnbFNsSWJDU3FaMDlVRkxwOENMR1I4ZElITktDU21sNlNveHF2VkloVytG?=
 =?utf-8?B?MzdoaGh6WmJXTXRKWkoyYlV1Sk5YU2FNZ2xEb2ppUis1aU81enZKYjRGNXF4?=
 =?utf-8?B?UlhpWjJFc3VJUFgvYmZjSnFRczVzUXdobWFhVFBCemRxaEg0MzlTa0pvYXV3?=
 =?utf-8?B?UHhwUWJsUVpWZVdXektSVGVZaUc1bzNFYlRxK1BqR25NWFJKMFRFVVJiNVps?=
 =?utf-8?B?YjV5a25zbm1mZnArVEpGd0krS3BDOWNzUUdSNkNWNjVMRzk5SlpIQlZrcGpp?=
 =?utf-8?B?L1B2ZWgxSjRURXJvdWJNSTRqRGs1RDF3Ym9idDZ4M1JPQi9KcWhGRHJqOUhS?=
 =?utf-8?B?dEl6Y1lhREx6WkdEVGx2OGpkdHYyVjBMaUhLTnRUc3pOSlhCOWV6amswek94?=
 =?utf-8?B?RnpnVjE1a2RZSTVzZW9WQzhweGkzMVVWSUZmMEllcjIxaStDWEVrR00xYkZQ?=
 =?utf-8?B?ZURUd0wybDhjbkhqZ1lJWlR5bjBtZTdrN2VET213WDczUXIrQ2Jma2ZFZnoz?=
 =?utf-8?B?dE05ZXJ2dUI0aWdGdVZ4MmdSU0l3QUppOC9DNml5cnAwU1JVUHRlSDkzSk84?=
 =?utf-8?B?OHhoT2E0QmNONUNEYzJkcXRaQUlzeUtRQVY1UnRYQjg2V1AyK2NXYmc5VXc2?=
 =?utf-8?B?ME1rV1NJa1pNTWlXblRrRmRvNktWWjJWb2hlVTVWYlkvbGpyT0VxM09STmZw?=
 =?utf-8?B?cXR2SnB6Y1VqcmVOb1cvam5sUzhjK0VpeWZRd0UyS1hXWHU2ZWU1NTZ3eW5v?=
 =?utf-8?B?V0tZR25uVkt6Tml6eTQwT0hSUEtKL3VENit0ZHlMWVJOQU9jMjI0bzhpeUN0?=
 =?utf-8?B?VHZqZVgxTllYN2RwTStxak9Oak9IWmlPMGRySjJWMTkvazFwTmNRVTN1Z2dl?=
 =?utf-8?B?LzJUNklRTGc0SGJNYmk4UnhONGVLdUxXSklwNkw4eFhwQ3F2eHJTMmcwV3pY?=
 =?utf-8?B?eW5OV2NZS21hdUhGVStqQ1VyZFAxSy9tVW11Mmd1bWhrSkV5WW1rc2xhMG9V?=
 =?utf-8?B?MUNtd3Q1L0NsK1MrUnc2bFh4WlNlTEkxeFVTSkpLU2xhWHJDUkpYRWQ1K1NH?=
 =?utf-8?B?VzVIL3pIUGkzWjB3M0hHeGJRbEpWK2hBTWRFZzErYUdaR1ZmTXVCMWpuaXFH?=
 =?utf-8?B?anlXazRBb0E2NTdYOHF0cWlJWjFNMmlkckpTbDJ0cy9nMTNnK2xRb2VaRGhk?=
 =?utf-8?B?dUw5bGZ5R2N0ck5rTUlxSzlpcEZRRXNFekkzOXpsaCtTdTZreHl3V0FSL3hV?=
 =?utf-8?B?MFB4Q1l2bzlWdDJ3aDY1QzJnYlM2cWg0NUo3MGluSVIyeTJBdUdKM0QyR0tI?=
 =?utf-8?B?ODRiMllyQUw4OHRWTnQrdmdSQUsxMUNVWEhXcFJhTElZVC93MjFFLzdLWU82?=
 =?utf-8?B?dzBkUkk1b1FwSEZHdDdXRDVnSkVtSFZmNm9CUmc1dkhxK0c1UWxVTEJsTXN4?=
 =?utf-8?Q?+qmqJyEfDgD7KMOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a03e86e6-a080-44aa-691b-08da37f02074
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 10:29:30.2368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6krQgvZ7IOvIdJCUJdcTuMls9oIgIIi7Kli4ky6lPaoDknCmDaUMTpB1EBPTdRLWmCwbZsibZqKlVj72pNbuF7afi9J2drDkEtDw9luev4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1802
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgU3ZlbiwNCg0KPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQo+IFZvbjog
U3ZlbiBTY2h3ZXJtZXIgPHN2ZW5Ac3ZlbnNjaHdlcm1lci5kZT4NCj4gR2VzZW5kZXQ6IERpZW5z
dGFnLCAzLiBNYWkgMjAyMiAxNDoxNw0KPiBBbjogbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmcN
Cj4gQ2M6IHBhdmVsQHVjdy5jeg0KPiBCZXRyZWZmOiBTZXR0aW5nIG11bHRpLWNvbG9yIGludGVu
c2l0aWVzIHN0b3BzIHNvZnR3YXJlIGJsaW5rDQo+IA0KPiBIaSwNCj4gDQo+IEknbSBleHBlcmll
bmNpbmcgYW4gaXNzdWUgd2l0aCBtdWx0aS1jb2xvciBMRURzIHdoZW4gc2V0dGluZyB0aGUNCj4g
aW50ZW5zaXRpZXMgd2hpbGUgc29mdHdhcmUgYmxpbmtpbmcgaXMgYWN0aXZlIChlLmcuIHRyaWdn
ZXI9dGltZXIpLiBUaGlzDQo+IG1hbmlmZXN0cyBpdHNlbGYgYnkgZGVsYXlfb24gYW5kIGRlbGF5
X29mZiBiZWluZyBzZXQgdG8gMCB3aGVuIHdyaXRpbmcNCj4gbXVsdGlfaW50ZW5zaXRpZXMgd2hp
bGUgdGhlIExFRCBpcyBvZmYuIElmIGRvaW5nIHRoaXMgd2hpbGUgdGhlIExFRCBpcw0KPiBvbiwg
ZXZlcnl0aGluZyB3b3JrcyBhcyBleHBlY3RlZC4NCg0KQXQgbGVhc3QgSSBjYW4gc2VlIHRoZSBz
YW1lIHRoaW5nLiBTZXR1cCBhIGxlZCBsaWtlIHRoaXM6DQplY2hvIDI1NSAwIDAgfCBzdWRvIHRl
ZSAvc3lzL2NsYXNzL2xlZHMvcmdiXDpmYngtbGVkLTEvbXVsdGlfaW50ZW5zaXR5DQplY2hvIDEw
MCB8IHN1ZG8gdGVlIC9zeXMvY2xhc3MvbGVkcy9yZ2JcOmZieC1sZWQtMS9icmlnaHRuZXNzDQpl
Y2hvICJ0aW1lciIgfCBzdWRvIHRlZSAvc3lzL2NsYXNzL2xlZHMvcmdiXDpmYngtbGVkLTEvdHJp
Z2dlcg0KZWNobyA1MDAwIHwgc3VkbyB0ZWUgL3N5cy9jbGFzcy9sZWRzL3JnYlw6ZmJ4LWxlZC0x
L2RlbGF5X29uDQplY2hvIDUwMDAgfCBzdWRvIHRlZSAvc3lzL2NsYXNzL2xlZHMvcmdiXDpmYngt
bGVkLTEvZGVsYXlfb2ZmDQoNCkNoYW5nZSB0aGUgY29sb3IgYWZ0ZXJ3YXJkcyB3aGlsZSB0aGUg
TEVEIGlzIGluIHRoZSAib24iIGN5Y2xlDQplY2hvIDAgMjU1IDAgfCBzdWRvIHRlZSAvc3lzL2Ns
YXNzL2xlZHMvcmdiXDpmYngtbGVkLTEvbXVsdGlfaW50ZW5zaXR5DQpubyBwcm9ibGVtLCBvbiB0
aGUgbmV4dCAib24iIGN5Y2xlIHRoZSBsZWQgaGFzIHRoZSBuZXcgaW50ZW5zaXR5DQoNCkNoYW5n
ZSB0aGUgY29sb3IgYWZ0ZXJ3YXJkcyB3aGlsZSB0aGUgTEVEIGlzIGluIHRoZSAib2ZmIiBjeWNs
ZQ0KZWNobyAwIDI1NSAwIHwgc3VkbyB0ZWUgL3N5cy9jbGFzcy9sZWRzL3JnYlw6ZmJ4LWxlZC0x
L211bHRpX2ludGVuc2l0eQ0KdGhlIGxlZCBzdGF5cyBvZmYgYmVjYXVzZSBkZWxheV9vbiBhbmQg
ZGVsYXlfb2ZmIGlzIDAuDQoNClRoaXMgYWxzbyBsb29rcyBsaWtlIGluY29ycmVjdCBiZWhhdmlv
ciB0byBtZS4NCg0KPiBJIHN1c3BlY3QgdGhhdCB0aGlzIGhhcHBlbnMgYmVjYXVzZSBtdWx0aV9p
bnRlbnNpdHlfc3RvcmUoKSBjYWxscw0KPiBsZWRfc2V0X2JyaWdodG5lc3MobGVkX2NkZXYsIGxl
ZF9jZGV2LT5icmlnaHRuZXNzKSBhdCB0aGUgZW5kLiBJdCBzZWVtcw0KPiBsaWtlIHRoZSBzb2Z0
d2FyZSBibGlua2luZyBtb2RpZmllcyBsZWRfY2Rldi0+YnJpZ2h0bmVzcyBkaXJlY3RseSwgc28g
aWYNCj4gdGhlIExFRCBpcyBpbiBpdHMgb2ZmLXBoYXNlLCB3ZSdyZSBlZmZlY3RpdmVseSBzd2l0
Y2hpbmcgdGhlIExFRCBvZmYNCj4gYmVjYXVzZSB3ZSdyZSBzZXR0aW5nIGl0cyBicmlnaHRuZXNz
IHRvIDAgd2hpY2ggY2xlYXJzIGRlbGF5X29uIGFuZA0KPiBkZWxheV9vZmYgdG8gMDoNCj4gDQo+
IGxlZF9zZXRfYnJpZ2h0bmVzcyhicmlnaHRuZXNzPTApOiBzZXRzIExFRF9CTElOS19ESVNBQkxF
DQo+ICAgLT4gc2V0X2JyaWdodG5lc3NfZGVsYXllZCgpDQo+ICAgIC0+IGxlZF9zdG9wX3NvZnR3
YXJlX2JsaW5rKCk6IGNsZWFycyBibGluayBkZWxheXMNCj4gDQo+IEhvdyB3b3VsZCBvbmUgZml4
IHRoaXMgcHJvcGVybHk/IFNob3VsZCBtdWx0aV9pbnRlbnNpdHlfc3RvcmUoKSBjYWxsDQo+IGxl
ZF9zZXRfYnJpZ2h0bmVzcygpIHdpdGggYnJpZ2h0bmVzcz1sZWRfY2Rldi0+YmxpbmtfYnJpZ2h0
bmVzcyBpZg0KPiBibGlua2luZyBpcyBhY3RpdmU/IFRoYXQgZmVlbHMgbGlrZSBhbiB1bmNsZWFu
IHNvbHV0aW9uLg0KPiANCj4gSSdtIGhvcGluZyBmb3Igc29tZSBpbnB1dC4gVGhhbmtzIDopDQoN
ClRvIG1lIHRoaXMgbG9va3Mgd3Jvbmc6DQoNCnZvaWQgbGVkX3NldF9icmlnaHRuZXNzKHN0cnVj
dCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2LCB1bnNpZ25lZCBpbnQgYnJpZ2h0bmVzcykNCnsNCgkv
Kg0KCSAqIElmIHNvZnR3YXJlIGJsaW5rIGlzIGFjdGl2ZSwgZGVsYXkgYnJpZ2h0bmVzcyBzZXR0
aW5nDQoJICogdW50aWwgdGhlIG5leHQgdGltZXIgdGljay4NCgkgKi8NCglpZiAodGVzdF9iaXQo
TEVEX0JMSU5LX1NXLCAmbGVkX2NkZXYtPndvcmtfZmxhZ3MpKSB7DQoJCS8qDQoJCSAqIElmIHdl
IG5lZWQgdG8gZGlzYWJsZSBzb2Z0IGJsaW5raW5nIGRlbGVnYXRlIHRoaXMgdG8gdGhlDQoJCSAq
IHdvcmsgcXVldWUgdGFzayB0byBhdm9pZCBwcm9ibGVtcyBpbiBjYXNlIHdlIGFyZSBjYWxsZWQN
CgkJICogZnJvbSBoYXJkIGlycSBjb250ZXh0Lg0KCQkgKi8NCgkJaWYgKCFicmlnaHRuZXNzKSB7
DQoJCQlzZXRfYml0KExFRF9CTElOS19ESVNBQkxFLCAmbGVkX2NkZXYtPndvcmtfZmxhZ3MpOw0K
DQpJIHRoaW5rIGl0IGlzIHdyb25nIHRvIGFzayBmb3IgdGhlIGJyaWdodG5lc3Mgb3ZlciBoZXJl
IHdoZW4gd2Uga25vdw0KdGhhdCB0aGUgbGVkIGlzIGJsaW5raW5nIGFuZCBjb3VsZCBiZSBjdXJy
ZW50bHkgaW4gaXQncyBvZmYgY3ljbGUuDQoNCgkJCXNjaGVkdWxlX3dvcmsoJmxlZF9jZGV2LT5z
ZXRfYnJpZ2h0bmVzc193b3JrKTsNCgkJfSBlbHNlIHsNCgkJCXNldF9iaXQoTEVEX0JMSU5LX0JS
SUdIVE5FU1NfQ0hBTkdFLA0KCQkJCSZsZWRfY2Rldi0+d29ya19mbGFncyk7DQoJCQlsZWRfY2Rl
di0+bmV3X2JsaW5rX2JyaWdodG5lc3MgPSBicmlnaHRuZXNzOw0KDQpJIHRoaW5rIHRoZSBlbHNl
IHBhdGggY291bGQgYWx3YXlzIGJlIGRvbmUgcmVnYXJkbGVzcyBvZiB0aGUgYnJpZ2h0bmVzcz8N
Cg0KCQl9DQoJCXJldHVybjsNCgl9DQoNCg0KUmVnYXJkcywNCg0KICAgU3Zlbg0KDQo=
